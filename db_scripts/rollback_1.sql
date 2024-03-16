/*-------------Suppression de la table band-------------*/
DROP TABLE IF EXISTS band;

/*-------------Création de la table singer-------------*/
CREATE TABLE IF NOT EXISTS singer (     singerName varchar(50),
                                        firstName varchar(50),
                                        lastName varchar(50),
                                        age int,
                                        PRIMARY KEY(singerName));
/*-------------Insertion de la projetction des 4 premiers attribut de la table Band-------------*/
INSERT INTO singer
SELECT musicianName, firstName, lastName, age
FROM musician;
/*-------------Création de la table singer (fin)-------------*/

/*-------------Création Dépendance singer-musician-------------*/
ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE album ADD CONSTRAINT FK_A_singerName FOREIGN KEY (singerName) REFERENCES singer(singerName);

/*-------------Suppression de la table musician-------------*/
DROP TABLE IF EXISTS musician;

