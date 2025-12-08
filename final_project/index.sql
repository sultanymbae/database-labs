CREATE INDEX idx_cars_clientid ON Cars(ClientID);

EXPLAIN ANALYZE
SELECT * FROM Cars WHERE ClientID = 123;
