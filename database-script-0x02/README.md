# Airbnb Database Seed Script

## Overview
This directory contains the SQL script to populate the **Airbnb Database** with sample data for testing and demonstration purposes.

The data reflects realistic Airbnb-like scenarios, including users (hosts, guests, admins), property listings, bookings, payments, reviews, and messages.

---

## Files
- **seed.sql** — Contains SQL `INSERT` statements for all database tables.
- **README.md** — This documentation file explaining the contents and usage.

---

## Database
**Database Name:** `airbnb_db`

Ensure you have already created and migrated the schema before running this seed script.
If not, execute the `schema.sql` file from the previous task first.

---

## Entities Populated

| Table | Description |
|--------|--------------|
| **users** | Hosts, guests, and admin users. |
| **properties** | Properties listed by hosts for rent. |
| **bookings** | User reservations with booking details. |
| **payments** | Transactions for bookings. |
| **reviews** | Feedback from users about their stays. |
| **messages** | Direct communication between users. |

---

## Usage

1. Open MySQL or your preferred SQL client.
2. Run the following commands:

```bash
mysql -u root -p
