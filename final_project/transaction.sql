BEGIN;

WITH next_id AS (
    SELECT COALESCE(MAX(ID), 0) + 1 AS new_id
    FROM Clients
),
insert_client AS (
    INSERT INTO Clients (ID, Name, Email, PhoneNumber)
    SELECT new_id, 'Test Client', 'test@example.com', '+996700000000'
    FROM next_id
    RETURNING ID
)
INSERT INTO Cars (ID, Brand, SpecialNumber, ClientID)
SELECT 
    (SELECT COALESCE(MAX(ID), 0) + 1 FROM Cars), 
    'Toyota',
    'TEST-001',
    ID
FROM insert_client;

COMMIT;
ROLLBACK

SELECT * FROM Clients ORDER BY ID DESC LIMIT 5;
SELECT * FROM Cars ORDER BY ID DESC LIMIT 5;
