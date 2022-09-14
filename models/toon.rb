def all_toons
    run_sql("SELECT * FROM toons ORDER BY id")
  end
  
  def create_toon(name, d_or_e)
    run_sql("INSERT INTO toons(name, d_or_e) VALUES($1, $2)", [name, d_or_e])
  end
  
  def get_toon(id)
    run_sql("SELECT * FROM toons WHERE id = $1", [id])[0]
  end
  
  def update_toon(id, name, d_or_e)
    run_sql("UPDATE toons SET name = $2, d_or_e = $3 WHERE id = $1", [id, name, d_or_e])
  end
  
  def delete_toon(id)
    run_sql("DELETE FROM toons WHERE id = $1", [id])
  end