/* 
1️Non-correlated Subquery
Find all properties where the average rating is greater than 4.0
*/
SELECT 
    properties.id,
    properties.name,
    properties.location
FROM properties
WHERE properties.id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY properties.id;


/* 
2️Correlated Subquery
Find users who have made more than 3 bookings
*/
SELECT 
    users.id,
    users.name,
    users.email
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings
    WHERE bookings.user_id = users.id
) > 3
ORDER BY users.id;