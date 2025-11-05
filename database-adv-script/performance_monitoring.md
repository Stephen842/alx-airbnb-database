# Database Performance Monitoring & Refinement Report

### Step 1 – Monitor Query Performance

I used `EXPLAIN ANALYZE` to evaluate the performance of two frequently used queries:

#### Query A — Fetch bookings with user and property details
```sql
EXPLAIN ANALYZE
SELECT 
    b.id,
    u.name,
    p.name,
    b.start_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date IS NOT NULL;
