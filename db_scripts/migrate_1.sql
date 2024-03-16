-- Active: 1706150356599@@127.0.0.1@3306@atelier_bd
/*-------------Création table band-------------*/
CREATE TABLE IF NOT EXISTS band(bandName varchar(50) PRIMARY KEY, creation YEAR, genre varchar(50));
INSERT INTO band VALUES ("Crazy Duo", 2015, "rock"),
("Luna", 2009, "classical"), ("Mysterio", 2019, "pop");
/*-------------Création table band (fin)-------------*/

/*-------------Création table musician-------------*/
/*Création de la table musician*/
CREATE TABLE musician (musicianName varchar(50), firstName varchar(50),
                                        lastName varchar(50),
                                        age int,
                                        role varchar(50),
                                        bandName varchar(50),
                                        PRIMARY KEY(musicianName));

/*Mettre les éléments de la table singer dans la table musician*/
INSERT INTO musician (musicianName, firstName, lastName, age)
SELECT *
FROM singer;

/*-------------Création table musician (fin)-------------*/

/*-------------Création Dépendance album-musician-------------*/
ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE album ADD CONSTRAINT FK_A_singerName FOREIGN KEY (singerName) 
REFERENCES musician(musicianName);
/*-------------Création Dépendance album-musician (fin)-------------*/

/*-------------Suppression singer-------------*/
DROP TABLE IF EXISTS singer;

/*-------------Configuration éléments musician-------------*/
UPDATE musician SET role = "vocals" WHERE musicianName = "Alina";
UPDATE musician SET role = "guitar" WHERE musicianName = "Mysterio";
UPDATE musician SET role = "percussion" WHERE musicianName = "Rainbow";
UPDATE musician SET role="piano" WHERE musicianName = "Luna";

UPDATE musician SET bandName = "Crazy Duo" 
WHERE musicianName = "Alina" OR musicianName = "Rainbow";

UPDATE musician M SET M.bandName = M.musicianName
WHERE M.musicianName <> "Alina" AND M.musicianName <> "Rainbow";
/*-------------Configuration éléments musician (fin)-------------*/