CREATE DATABASE IF NOT EXISTS trackstar_dev;

CREATE USER 'trackstar'@'localhost' IDENTIFIED BY  'trackstar';

GRANT ALL PRIVILEGES ON  `trackstar_dev` . * TO  'trackstar'@'localhost';

FLUSH PRIVILEGES;

USE trackstar_dev;

CREATE TABLE IF NOT EXISTS tbl_project (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128),
    description TEXT,
    create_time DATETIME,
    create_user_id INTEGER,
    update_time DATETIME,
    update_user_id INTEGER
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tbl_issue (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(256) NOT NULL,
    description varchar(2000),
    project_id INTEGER,
    type_id INTEGER,
    status_id INTEGER,
    owner_id INTEGER,
    requester_id INTEGER,
    create_time DATETIME,
    create_user_id INTEGER,
    update_time DATETIME,
    update_user_id INTEGER
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tbl_user (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email Varchar(256) NOT NULL,
    username Varchar(256),
    password Varchar(256),
    last_login_time Datetime,
    create_time DATETIME,
    create_user_id INTEGER,
    update_time DATETIME,
    update_user_id INTEGER
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tbl_project_user_assignment (
    project_id Int(11) NOT NULL,
    user_id Int(11) NOT NULL,
    create_time DATETIME,
    create_user_id INTEGER,
    update_time DATETIME,
    update_user_id INTEGER,
    PRIMARY KEY (project_id, user_id)
) ENGINE = InnoDB;

-- The Relationships
ALTER TABLE tbl_issue ADD CONSTRAINT FK_issue_project
    FOREIGN KEY (project_id) REFERENCES tbl_project (id)
    ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE tbl_issue ADD CONSTRAINT FK_issue_owner
    FOREIGN KEY (owner_id) REFERENCES tbl_user (id)
    ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE tbl_issue ADD CONSTRAINT FK_issue_requester
    FOREIGN KEY (requester_id) REFERENCES tbl_user (id)
    ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE tbl_project_user_assignment ADD CONSTRAINT FK_project_user
    FOREIGN KEY (project_id) REFERENCES tbl_project (id)
    ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE tbl_project_user_assignment ADD CONSTRAINT FK_user_project
    FOREIGN KEY (user_id) REFERENCES tbl_user (id)
    ON DELETE CASCADE ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS AuthItem (
   `name`                 varchar(64) not null,
   `type`                 integer not null,
   `description`          text,
   `bizrule`              text,
   `data`                 text,
   primary key (`name`)
) engine InnoDB;

CREATE TABLE IF NOT EXISTS AuthItemChild (
   `parent`               varchar(64) not null,
   `child`                varchar(64) not null,
   primary key (`parent`,`child`),
   foreign key (`parent`) references `AuthItem` (`name`) on delete cascade on update cascade,
   foreign key (`child`) references `AuthItem` (`name`) on delete cascade on update cascade
) engine InnoDB;

CREATE TABLE IF NOT EXISTS AuthAssignment (
   `itemname`             varchar(64) not null,
   `userid`               varchar(64) not null,
   `bizrule`              text,
   `data`                 text,
   primary key (`itemname`,`userid`),
   foreign key (`itemname`) references `AuthItem` (`name`) on delete cascade on update cascade
) engine InnoDB;

CREATE TABLE IF NOT EXISTS tbl_project_user_role (
    project_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    role VARCHAR(64) NOT NULL,
    primary key (project_id,user_id,role),
    foreign key (project_id) references tbl_project (id),
    foreign key (user_id) references tbl_user (id),
    foreign key (role) references AuthItem (name)
) engine InnoDB;

-- Insert some seed data so we can just begin using the database
INSERT INTO tbl_user (email, username, password) VALUES
    ('test1@notanaddress.com','Test_User_One', MD5('test1')),
    ('test2@notanaddress.com','Test_User_Two', MD5('test2'));

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
    ('createIssue', 0, 0x6372656174652061206e6577206973737565, NULL, 0x4e3b),
    ('createProject', 0, 0x6372656174652061206e65772070726f6a656374, NULL, 0x4e3b),
    ('createUser', 0, 0x6372656174652061206e65772075736572, NULL, 0x4e3b),
    ('deleteIssue', 0, 0x64656c65746520616e2069737375652066726f6d20612070726f6a656374, NULL, 0x4e3b),
    ('deleteProject', 0, 0x64656c65746520612070726f6a656374, NULL, 0x4e3b),
    ('deleteUser', 0, 0x72656d6f7665206120757365722066726f6d20612070726f6a656374, NULL, 0x4e3b),
    ('member', 2, '', NULL, 0x4e3b),
    ('owner', 2, '', NULL, 0x4e3b),
    ('readIssue', 0, 0x7265616420697373756520696e666f726d6174696f6e, NULL, 0x4e3b),
    ('readProject', 0, 0x726561642070726f6a65637420696e666f726d6174696f6e, NULL, 0x4e3b),
    ('readUser', 0, 0x7265616420757365722070726f66696c6520696e666f726d6174696f6e, NULL, 0x4e3b),
    ('reader', 2, '', NULL, 0x4e3b),
    ('updateIssue', 0, 0x75706461746520697373756520696e666f726d6174696f6e, NULL, 0x4e3b),
    ('updateProject', 0, 0x7570646174652070726f6a65637420696e666f726d6174696f6e, NULL, 0x4e3b),
    ('updateUser', 0, 0x757064617465206120757365727320696e666f726d6174696f6e, NULL, 0x4e3b);

INSERT INTO `AuthItemChild` (`parent`, `child`) VALUES
    ('member', 'createIssue'),
    ('owner', 'createProject'),
    ('owner', 'createUser'),
    ('member', 'deleteIssue'),
    ('owner', 'deleteProject'),
    ('owner', 'deleteUser'),
    ('owner', 'member'),
    ('reader', 'readIssue'),
    ('reader', 'readProject'),
    ('reader', 'readUser'),
    ('member', 'reader'),
    ('owner', 'reader'),
    ('member', 'updateIssue'),
    ('owner', 'updateProject'),
    ('owner', 'updateUser');

