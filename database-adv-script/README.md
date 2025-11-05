# Complex SQL Joins – Airbnb Database Project

This task is part of the ALX Airbnb Database Advanced SQL module.  
The objective is to demonstrate proficiency in SQL join operations.

---

## 0. Queries Implemented

### 1 INNER JOIN
Retrieves only the bookings that are linked to existing users.

**Use Case:** Show users who have made bookings.

```sql
SELECT ... FROM bookings
INNER JOIN users ON bookings.user_id = users.id;


## 1. Subqueries

### Non-Correlated Subquery
Used to find properties where the average review rating is above 4.0.

### Correlated Subquery
Used to find users who have made more than 3 bookings.  
The subquery depends on each user row — executed repeatedly.

## 2. Aggregation and Window Functions

### Total Bookings Per User
Uses `COUNT()` and `GROUP BY` to summarize user booking activity.

### Ranking Properties
Uses `RANK()` window function to sort properties by popularity (bookings).