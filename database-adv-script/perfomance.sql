/* Initial Complex Query (Without Optimization) */
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;


/* Check Performance Before Optimization */
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;


/* Optimized Query (Uses Indexing + Reduced Columns + Filtering Example) */
EXPLAIN ANALYZE
SELECT 
    b.id,
    u.name,
    p.name,
    pay.amount,
    pay.status
FROM bookings b
STRAIGHT_JOIN users u ON b.user_id = u.id
STRAIGHT_JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date IS NOT NULL;
