/* 
1️Aggregation: Total number of bookings per user
*/
SELECT 
    users.id,
    users.name,
    COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings
    ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;


/* 
2️Window Function: Rank properties by number of bookings
*/
SELECT 
    properties.id,
    properties.name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings 
    ON properties.id = bookings.property_id
GROUP BY properties.id, properties.name
ORDER BY total_bookings DESC;