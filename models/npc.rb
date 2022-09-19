def all_npc
    run_sql("SELECT * FROM npc ORDER BY id")
end

def create_npc(choice, typeof)
    run_sql("INSERT INTO npc(choice, typeof) VALUES ($1, $2)" [choice, typeof])
end

def delete_npc(id)
    run_sql("DELETE FROM foods WHERE id = $1" [id])
end

def update_npc(typeof)
    run_sql("UPDATE npc SET typeof = $1", [typeof])
end
  
def get_npc(anything)
    run_sql("SELECT * FROM npc ORDER BY id")
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
