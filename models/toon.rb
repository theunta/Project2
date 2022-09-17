def all_toons
    run_sql("SELECT * FROM toons ORDER BY id")
  end
  
  def create_toon(name)
    run_sql("INSERT INTO toons(name) VALUES($1, $2)", [name])
  end
  
  def get_toon(id)
    run_sql("SELECT * FROM toons WHERE id = $1", [id])[0]
  end
  
  def update_toon(id, name)
    run_sql("UPDATE toons SET name = $2 = $3 WHERE id = $1", [id, name])
  end
  
  def delete_toon(id)
    run_sql("DELETE FROM toons WHERE id = $1", [id])
  end