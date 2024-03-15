-- Active: 1706150356599@@127.0.0.1@3306@atelier_bd
CREATE TABLE IF NOT EXISTS band(bandName varchar(50) PRIMARY KEY, creation YEAR, genre varchar(50));
INSERT INTO band VALUES ("crazy Duo", 2015, "rock"),
("Luna", 2009, "classical"), ("Mysterio", 2019, "pop");


ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE singer ADD COLUMN musicianName varchar(50);
UPDATE singer SET musicianName = singerName;
ALTER TABLE singer DROP COLUMN singerName;
ALTER TABLE singer ADD PRIMARY KEY (musicianName);
ALTER TABLE album ADD CONSTRAINT FK_A_singerName FOREIGN KEY (singerName) REFERENCES singer(musicianName) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE singer ADD COLUMN role varchar(50), ADD COLUMN bandName varchar(50);

UPDATE singer SET role = "vocals" WHERE musicianName = "Alina";
UPDATE singer SET role = "Guitar" WHERE musicianName = "Mysterio";
UPDATE singer SET role = "percussion" WHERE musicianName = "Rainbow";
UPDATE singer SET role="piano" WHERE musicianName = "Luna";

UPDATE singer SET bandName = "Crazy Duo" 
WHERE musicianName = "Alina" OR musicianName = "Rainbow";

UPDATE singer S SET S.bandName = S.musicianName
WHERE S.musicianName <> "Alina" AND S.musicianName <> "Rainbow";

ALTER TABLE singer RENAME TO musician;

