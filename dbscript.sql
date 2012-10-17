CREATE DATABASE IF NOT EXISTS trackstar_dev;

CREATE USER 'trackstar'@'localhost' IDENTIFIED BY  'trackstar';

GRANT ALL PRIVILEGES ON  `trackstar_dev` . * TO  'trackstar'@'localhost';

FLUSH PRIVILEGES;

USE trackstar_dev;

CREATE TABLE tbl_project (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128),
    description TEXT,
    create_time DATETIME,
    create_user_id INTEGER,
    update_time DATETIME,
    update_user_id INTEGER
);

