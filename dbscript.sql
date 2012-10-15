CREATE DATABASE trackstar_dev;

CREATE USER 'trackstar'@'%' IDENTIFIED BY  'trackstar';

GRANT ALL PRIVILEGES ON * . * TO  'trackstar'@'%'  IDENTIFIED BY  'trackstar' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

GRANT ALL PRIVILEGES ON  `trackstar_dev` . * TO  'trackstar'@'%';

CREATE USER 'trackstar'@'localhost' IDENTIFIED BY  'trackstar';

GRANT ALL PRIVILEGES ON * . * TO  'trackstar'@'localhost' IDENTIFIED BY  'trackstar' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;

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

