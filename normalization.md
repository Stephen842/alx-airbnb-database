# Airbnb Database Normalization (Up to 3NF)

## Step 1: First Normal Form (1NF)
- All tables contain atomic (indivisible) values.
- There are no repeating groups or multiple values in any single field.
- Each record is uniquely identified by a primary key.

All tables meet 1NF.

---

## Step 2: Second Normal Form (2NF)
- All non-key attributes depend on the entire primary key.
- There are no partial dependencies since all tables use a single-column primary key (UUID).

All tables meet 2NF.

---

## Step 3: Third Normal Form (3NF)
- All non-key attributes depend only on the primary key.
- There are no transitive dependencies.
- Each field describes the entity it belongs to.

All tables meet 3NF.

---

## Notes and Observations
- The database design avoids redundancy and update anomalies.
- The `location` field in the `Property` table could be decomposed into separate tables (e.g., City, Country) for further normalization in large-scale deployments.
- The schema supports scalability and data integrity across all relationships.

---

## Conclusion
The Airbnb database schema successfully satisfies the requirements for **Third Normal Form (3NF)**, ensuring data consistency, minimizing redundancy, and optimizing data integrity.

