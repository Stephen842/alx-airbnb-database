/* Drop existing partitioning if any */
ALTER TABLE bookings
REMOVE PARTITIONING;


/* Partition Bookings Table by YEAR(start_date) */
ALTER TABLE bookings
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


/* Query to test performance on a date range */
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';


/* Another performance test on exact match */
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE YEAR(start_date) = 2023;
