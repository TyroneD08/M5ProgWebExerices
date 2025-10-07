-- Table: Crew
CREATE TABLE Crew (
    crew_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    species VARCHAR(50),
    `rank` VARCHAR(50),
    birth_year INT
);

-- Table: Missions
CREATE TABLE Missions (
    mission_id INT AUTO_INCREMENT PRIMARY KEY,
    mission_name VARCHAR(100),
    destination VARCHAR(100),
    start_date DATE,
    end_date DATE
);

-- Table: Crew_Missions (many-to-many relationship)
CREATE TABLE Crew_Missions (
    crew_id INT,
    mission_id INT,
    role VARCHAR(50),
    FOREIGN KEY (crew_id) REFERENCES Crew(crew_id),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);




-- De tabellen zijn niet direct zichtbaar omdat MySQL Workbench de lijst met tabellen niet automatisch ververst na het uitvoeren van CREATE TABLE.
-- Oplossing: Klik op de knop 'Refresh' (cirkelvormige pijl) naast de Schemas/Databases in het linkervenster.

-- 'rank' staat tussen backticks (`rank) omdat RANK een gereserveerd SQL-sleutelwoord is
-- De backticks geven aan dat het om een kolomnaam gaat en niet om een commando.


-- DATA INVOEGEN
INSERT INTO Crew (crew_id, name, species, `rank`, birth_year) VALUES
(10, 'Sharn', 'Andoriaan', 'Captain', 2310),
(11, 'Kira', 'Human', 'Major', 2295),
(12, 'Odo', 'Changeling', 'Chief of Security', 2301);

INSERT INTO Missions (mission_id, mission_name, destination, start_date, end_date) VALUES
(1, 'Grote Barrière', 'Galactic Rim', '2370-03-01', '2370-04-15'),
(2, 'Delta Scan', 'Delta Quadrant', '2371-08-20', '2371-11-30');

INSERT INTO Crew_Missions (crew_id, mission_id, role) VALUES
(10, 1, 'Navigator'),
(11, 1, 'Tactiek'),
(10, 2, 'Commandant'),
(12, 2, 'Onderzoeker');


-- SELECT QUERIES
SELECT * FROM Crew;

SELECT *
FROM Crew
WHERE species = 'Andoriaan' AND birth_year > 2300;





-- JOIN + ALIAS 

SELECT
    C.name,
    CM.role
FROM
    Crew C
INNER JOIN
    Crew_Missions CM ON C.crew_id = CM.crew_id;

SELECT
    C.name AS Bemanningslid,
    CM.role AS Rol,
    M.mission_name AS Missie
FROM
    Crew C
INNER JOIN
    Crew_Missions CM ON C.crew_id = CM.crew_id
INNER JOIN
    Missions M ON CM.mission_id = M.mission_id;


---

--  JOIN + WHERE 

SELECT
    M.mission_name,
    C.name
FROM
    Crew C
INNER JOIN
    Crew_Missions CM ON C.crew_id = CM.crew_id
INNER JOIN
    Missions M ON CM.mission_id = M.mission_id
WHERE
    M.mission_name = 'Grote Barrière';

SELECT
    M.mission_name,
    C.name
FROM
    Crew C
INNER JOIN
    Crew_Missions CM ON C.crew_id = CM.crew_id
INNER JOIN
    Missions M ON CM.mission_id = M.mission_id
WHERE
    M.mission_name = 'Delta Scan';


---

--  ORDER + LIMIT

SELECT
    name,
    birth_year
FROM
    Crew
ORDER BY
    birth_year DESC
LIMIT 2;


---

-- *** REKENEN ***

SELECT
    name,
    birth_year,
    (2400 - birth_year) AS leeftijd
FROM
    Crew;


---

-- *** GROUP BY ***

SELECT
    species,
    COUNT(crew_id) AS aantal
FROM
    Crew
GROUP BY
    species;