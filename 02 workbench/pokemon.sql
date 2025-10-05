CREATE DATABASE IF NOT EXISTS m5prog;
USE m5prog;

CREATE TABLE IF NOT EXISTS pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(50),
    element VARCHAR(50)
);

INSERT INTO pokemon (naam, element)
VALUES 
('Pikachu', 'Electric'),
('Charmander', 'Fire');

SELECT * FROM pokemon ORDER BY naam ASC;
SELECT * FROM pokemon ORDER BY element DESC;
