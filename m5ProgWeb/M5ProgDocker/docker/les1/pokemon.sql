CREATE DATABASE IF NOT EXISTS m5prog;
USE m5prog;

CREATE TABLE IF NOT EXISTS pokemon (
  id INT AUTO_INCREMENT PRIMARY KEY,
  naam VARCHAR(100) NOT NULL,
  element VARCHAR(50) NOT NULL
);

INSERT INTO pokemon (naam, element) VALUES
('Snorlax','Normal'),
('Mewtwo','Psychic');

SELECT * FROM pokemon ORDER BY naam ASC;
SELECT * FROM pokemon ORDER BY element DESC;