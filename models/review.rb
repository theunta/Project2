def all_review
    run_sql("SELECT * FROM review ORDER BY id")
  end
  
  def create_review(username, contents)
    run_sql("INSERT INTO review(username, contents) VALUES($1, $2)", [username, contents])
  end
  
  def get_review(id)
    run_sql("SELECT * FROM review WHERE id = $1", [id])[0]
  end
  
  def update_review(id, username, contents)
    run_sql("UPDATE review SET username = $2, contents = $3 WHERE id = $1", [id, username, contents])
  end
  
  def delete_review(id)
    run_sql("DELETE FROM review WHERE id = $1", [id])
  end