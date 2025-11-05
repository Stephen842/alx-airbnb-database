# Optimization of Complex Booking Query

### Initial Performance Issue
The first query joined multiple large tables (`users`, `properties`, `payments`) without filtering or index usage.  
This caused:

- Full table scans on `bookings`, `users`, and `properties`
- Unnecessary columns being selected
- Higher execution time

### Optimization Strategy

✔ Added filtering condition on `start_date` to reduce scanned rows  
✔ Enforced faster JOIN execution using `STRAIGHT_JOIN`, prioritizing indexed paths  
✔ Reduced selected columns to only those needed  
✔ Leveraged indexes already created on:
- `bookings.user_id`
- `bookings.property_id`
- `payments.booking_id`

### Result
After refactoring:

- Query execution time improved
- MySQL used indexes more efficiently
- Reduced load on JOIN operations

This approach aligns with SQL performance best practices and focuses on real-world scale optimization.