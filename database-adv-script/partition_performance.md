# Partitioning Performance Report

### Goal
Improve query performance on the `bookings` table by partitioning based on the `start_date` column.

---

### Implementation
Partitioned by:
- `YEAR(start_date)`
- Using `RANGE` partitioning strategy

Partitions created:
- 2021 → 2024 + `MAXVALUE`

---

### Performance Observation

| Query | Before Partitioning | After Partitioning | Improvement |
|------|------------------|------------------|------------|
| Fetch bookings by date range (2024 only) | Full table scan | Targets only one partition | 🚀 Faster |
| Filter using YEAR(start_date) = 2023 | Full scan | Only relevant partition scanned | ✅ Reduced work |

Reduced I/O.
Better execution plan.
Queries target specific partitions instead of scanning all records. 

---

### Conclusion
Partitioning the `bookings` table **significantly improves performance** for date-based queries.  
This optimization is ideal for large datasets frequently filtered by time ranges.
