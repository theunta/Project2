def find_user_by_email(email)
    users = run_sql("SELECT * FROM users WHERE email = $1", [email])
  
    if users.to_a.count > 0
      users[0]
    else
      nil
    end
end
  
def create_user(first_name, last_name, email, password, d_or_e, profession)
  password_digest = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(first_name, last_name, email, password_digest, d_or_e, profession) VALUES($1, $2, $3, $4, $5, $6)", [first_name, last_name, email, password_digest, d_or_e, profession])
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

