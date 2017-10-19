DROP TABLE IF EXISTS todos;

CREATE TABLE todos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
	description VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  completed_at DATETIME NOT NULL,
);

-- ---
-- Table 'todos_tags'
-- 
-- ---

DROP TABLE IF EXISTS todos_tags;

CREATE TABLE todos_tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  todo_id INTEGER NULL NOT NULL,
  tag_id INTEGER NULL NOT NULL,
  FOREIGN KEY(todo_id) REFERENCES todos(id)
  FOREIGN KEY(tag_id) REFERENCES tags(id)
);

-- ---
-- Table 'tags'
-- 
-- ---

DROP TABLE IF EXISTS tags;

CREATE TABLE tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text VARCHAR NOT NULL,
);


-- ---
-- Test Data
-- ---

-- INSERT INTO todos (id,description,created_at,completed_at) VALUES
-- ('','','','');
-- INSERT INTO todos_tags (id,todo_id,tag_id) VALUES
-- ('','','');
-- INSERT INTO tags (id,text) VALUES
-- ('','');

