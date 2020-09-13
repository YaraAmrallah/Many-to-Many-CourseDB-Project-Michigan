/* Create Database and its tables */

CREATE DATABASE roster
DEFAULT CHARACTER SET utf8;

USE roster;

DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Course;

CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Course (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Member (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
       ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (user_id, course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;


/* Fill the table */
INSERT INTO User (name) VALUES ('Maylea');
INSERT INTO User (name) VALUES ('Arandeep');
INSERT INTO User (name) VALUES ('Armelle');
INSERT INTO User (name) VALUES ('Eliot');
INSERT INTO User (name) VALUES ('Freya');
INSERT INTO User (name) VALUES ('Niraj');
INSERT INTO User (name) VALUES ('Abdisalam');
INSERT INTO User (name) VALUES ('Cejay');
INSERT INTO User (name) VALUES ('Cesar');
INSERT INTO User (name) VALUES ('Elliot');
INSERT INTO User (name) VALUES ('Koby');
INSERT INTO User (name) VALUES ('Ashleen');
INSERT INTO User (name) VALUES ('Khyla');
INSERT INTO User (name) VALUES ('Lorelei');
INSERT INTO User (name) VALUES ('Marcedez');

INSERT INTO Course (title) VALUES ('si106');
INSERT INTO Course (title) VALUES ('si110');
INSERT INTO Course (title) VALUES ('si206');

INSERT INTO Member (user_id,course_id,role) VALUES (1,1,1);
INSERT INTO Member (user_id,course_id,role) VALUES (2,1,0);
INSERT INTO Member (user_id,course_id,role) VALUES (3,1,0);
INSERT INTO Member (user_id,course_id,role) VALUES (4,1,0);
INSERT INTO Member (user_id,course_id,role) VALUES (5,1,0);
INSERT INTO Member (user_id,course_id,role) VALUES (6,2,1);
INSERT INTO Member (user_id,course_id,role) VALUES (7,2,0);
INSERT INTO Member (user_id,course_id,role) VALUES (8,2,0);
INSERT INTO Member (user_id,course_id,role) VALUES (9,2,0);
INSERT INTO Member (user_id,course_id,role) VALUES (10,2,0);
INSERT INTO Member (user_id,course_id,role) VALUES (11,3,1);
INSERT INTO Member (user_id,course_id,role) VALUES (12,3,0);
INSERT INTO Member (user_id,course_id,role) VALUES (13,3,0);
INSERT INTO Member (user_id,course_id,role) VALUES (14,3,0);
INSERT INTO Member (user_id,course_id,role) VALUES (15,3,0);

/* Make sure the DB has been filled correctly */
SELECT `User`.name, Course.title, Member.role
    FROM `User` JOIN Member JOIN Course
    ON `User`.user_id = Member.user_id AND Member.course_id = Course.course_id
    ORDER BY Course.title, Member.role DESC, `User`.name
