# Complex SQL Joins – Airbnb Database Project

This task is part of the ALX Airbnb Database Advanced SQL module.  
The objective is to demonstrate proficiency in SQL join operations.

---

## Queries Implemented

### 1 INNER JOIN
Retrieves only the bookings that are linked to existing users.

**Use Case:** Show users who have made bookings.

```sql
SELECT ... FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
