def find_user_by_email(email)
    users = run_sql("SELECT * FROM users WHERE email = $1", [email])
  
    if users.to_a.count > 0
      users[0]
    else
      nil
    end
end
  
def create_user(first_name, last_name, email, password, d_or_e, profession, wins, losses, draws)
  password_digest = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(first_name, last_name, email, password_digest, d_or_e, profession, wins, losses, draws) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)", [first_name, last_name, email, password_digest, d_or_e, profession, wins, losses, draws])
end

def delete_user(id)
  run_sql("DELETE FROM users WHERE id = $1", [id])
end

def find_user_by_id(id)
  run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end

def get_race(d_or_e)
  run_sql("SELECT * FROM users WHERE d_or_e = $1", [id])[0]
end

def get_prof(profession)
  run_sql("SELECT * FROM users WHERE profession = $1", [id])[0]
end

def update_user(id, d_or_e, profession)
  run_sql("UPDATE users SET d_or_e = $2, profession = $3 WHERE id = $1", [id, d_or_e, profession])
end

def update_score(id, wins, losses, draws)
  run_sql("UPDATE users SET wins = $2, losses = $3, draws = $4 WHERE id = $1", [id, wins, losses, draws])
end

def update_npc(typeof)
  run_sql("UPDATE npc SET typeof = $1", [typeof])
end

def get_npc(anything)
  monsters = ["dragon","horde of goblins","giant","troll","pack of orcs", "treant", "ghost", "bandit camp", "giant rat", "demon", "slime", "zombie", "skeleton", "harpy", "giant spider", "spirit", "lizardman", "mimic", "golem", "ghoul", "wraith", "kobold"]
  anything = monsters.sample
  update_npc(anything)
  return anything
end

def update_npc_choice(choice)
  run_sql("UPDATE npc SET choice = $1", [choice])
end

def get_npc_choice(anything)
  npc_options = ["Strength","Agility","Magic"]
  anything = npc_options.sample
  update_npc_choice(anything)
  return anything
end

def run_game(id, profession, wins, losses, draws)
  # conversion of profession to rps type
  choice = profession
  if choice == "Knight"
      choice = "Strength"
  elsif choice == "Warrior" 
      choice = "Strength"
  elsif choice == "Rogue"
      choice = "Agility"
  elsif choice == "Ranger"
      choice = "Agility"
  elsif choice == "Wizard"
      choice = "Magic"
  elsif choice == "Warlock"
      choice = "Magic"
  end

  #npc selector
  @npc_choice = get_npc_choice(@npc_choice)
  @npc_type = get_npc(@npc_type)
  puts "You venture out of town into the wilderness"
  puts "You find a #{@npc_type} and begin battle"
  puts "During the battle you find out your enemy is #{@npc_choice} type."

  # win handler
  if choice == @npc_choice
      draws = draws.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "Its a draw. Score has been updated"
  elsif choice == "Strength" && @npc_choice == "Magic"
      losses = losses.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "You lost. Score has been updated"
  elsif choice == "Strength" && @npc_choice == "Agility"
      wins = wins.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "You won. Score has been updated"
  elsif choice == "Agility" && @npc_choice == "Strength"
      losses = losses.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "You lost. Score has been updated"
  elsif choice == "Agility" && @npc_choice == "Magic"
      wins = wins.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "You won. Score has been updated"
  elsif choice == "Magic" && @npc_choice == "Strength"
      wins = wins.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "You won. Score has been updated"
  elsif choice == "Magic" && @npc_choice == "Agility"
      losses = losses.to_i + 1
      update_score(id, wins, losses, draws)
      return puts "You lost. Score has been updated"
  end
end