CREATE DATABASE IF NOT EXISTS database_design_db;
SHOW DATABASES;

USE database_design_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads_categories;


CREATE TABLE users
(
    id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email     VARCHAR(100) NOT NULL UNIQUE,
    user_name VARCHAR(150) NOT NULL UNIQUE,
    password  VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
)
;
CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    users_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
)
;

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)
;

CREATE TABLE ads_categories (
    ads_id INT UNSIGNED NOT NULL,
    categories_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ads_id) REFERENCES ads (id),
    FOREIGN KEY (categories_id) REFERENCES categories (id)
)
;

INSERT INTO categories (category_name) VALUES
                                           ('help wanted'),
                                           ('giveaway'),
                                           ('furniture');

INSERT INTO users(email, user_name, password) VALUES
                                                  ('ava@email', 'ava_smith', 'ava1234'),
                                                  ('jesse@email', 'jesse_dorman', 'jesse1234'),
                                                  ('cesar@email', 'cesar_vallin', 'cesar1234');

INSERT INTO ads(title, description, users_id) VALUES
                                                  ('Help wanted - professional jar opener', 'I struggle daily opening these dang jars, only if god could bestow upon me a strong and abled individual', 1),
                                                  ('Old sock - heavily used', 'tired of those fresh out the package pair of socks? Annoyed with pulling matched pairs out of your drier? look no further, I have the sock for you!', 2),
                                                  ('Giving away a chair!', 'Great chair, please steal me', 3);
INSERT INTO ads_categories(ads_id, categories_id) VALUES
                                                      (1, 1),
                                                      (2, 2),
                                                      (3, 2),
                                                      (3, 3);

SHOW TABLES;






