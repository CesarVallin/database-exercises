USE codeuptest_db;

-- select all albums
SELECT * FROM albums;
-- Make all the albums 10 times more popular (sales * 10)
UPDATE albums SET sales = sales * 10;
SELECT sales FROM albums;

-- select All albums released before 1980
SELECT * FROM albums
WHERE release_date < 1980;
-- Move all the albums before 1980 back to the 1800s.
UPDATE albums SET release_date = release_date - 100;
SELECT release_date FROM albums;

-- select All albums by Michael Jackson
SELECT * FROM albums
WHERE artist = 'Michael Jackson';

-- Change 'Michael Jackson' to 'Peter Jackson'
UPDATE albums SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

SELECT * FROM albums;



