def all_toons
    run_sql("SELECT * FROM toons ORDER BY id")
  end
  
  def create_toon(name, image_url)
    run_sql("INSERT INTO toons(name, image_url) VALUES($1, $2)", [name, image_url])
  end
  
  def get_toon(id)
    run_sql("SELECT * FROM toons WHERE id = $1", [id])[0]
  end
  
  def update_toon(id, name, image_url)
    run_sql("UPDATE toons SET name = $2, image_url = $3 WHERE id = $1", [id, name, image_url])
  end
  
  def delete_toon(id)
    run_sql("DELETE FROM toons WHERE id = $1", [id])
  end