PRAGMA foreign_keys = ON;

INSERT INTO robot (nom)
SELECT 'Omron JN'
WHERE NOT EXISTS (SELECT 1 FROM robot WHERE nom = 'Omron JN');