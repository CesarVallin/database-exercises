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

-- For a given ad, what is the email address of the user that created it?
SELECT email
FROM users
WHERE id IN (
        SELECT users_id
        FROM ads
        WHERE title = 'Old sock - heavily used'
    )
;

-- For a given ad, what category, or categories, does it belong to?

SELECT category_name
FROM categories
WHERE id IN (
        SELECT categories_id
        FROM ads_categories
        WHERE ads_id IN (
            SELECT id
            FROM ads
            WHERE title LIKE '%chair%'
            )
    )
;

-- For a given category, show all the ads that are in that category.
SELECT *
FROM ads
WHERE id IN (
    SELECT ads_id
    FROM ads_categories
    WHERE categories_id IN (
        SELECT id
        FROM categories
        WHERE category_name = 'giveaway'
        )
    )
;

-- For a given user, show all the ads they have posted.
SELECT *
FROM ads
WHERE users_id IN (
        SELECT id
        FROM users
        WHERE user_name = 'ava_smith'
    )
;



