# Index Optimization Performance Report

### Objective
Improve query performance by creating indexes on high-usage columns.

---

## Indexes Created

| Index Name | Table | Column | Purpose |
|------------|--------|--------|---------|
| idx_users_email | users | email | Faster login and user search |
| idx_properties_owner | properties | owner_id | Faster joins with users |
| idx_bookings_user | bookings | user_id | Retrieve bookings by user faster |
| idx_bookings_property | bookings | property_id | Faster property bookings lookup |

---

## Performance Comparison (Using EXPLAIN)

### Query tested:
```sql
SELECT * FROM bookings WHERE user_id = 5;
