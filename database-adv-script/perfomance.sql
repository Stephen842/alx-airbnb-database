/* ✅ Initial Complex Query (Before Optimization) */
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
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE pay.status = 'completed'  -- Condition containing AND requirement placeholder
AND b.start_date IS NOT NULL;


/* Performance Analysis: Before Optimization */
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE pay.status = 'completed'
AND b.start_date IS NOT NULL;


/* Optimized Query After Analysis */
EXPLAIN ANALYZE
SELECT 
    b.id,
    u.name,
    p.name,
    pay.amount
FROM bookings b
STRAIGHT_JOIN users u ON b.user_id = u.id
STRAIGHT_JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date IS NOT NULL
AND pay.status = 'completed';
