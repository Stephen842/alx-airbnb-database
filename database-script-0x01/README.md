
- **`schema.sql`** → Contains all SQL statements for creating the database and tables.  
- **`README.md`** → Provides documentation and explanation of the schema design.

---

## **Database Overview**
The database models a simplified version of Airbnb, including:
- User registration and roles (guest, host, admin)
- Property listings hosted by users
- Booking management
- Payment tracking
- User reviews and ratings
- Direct messaging between users

---

## **Database Schema**

### **1. Users Table**
Stores all users (guests, hosts, admins).

| Column | Type | Description |
|--------|------|-------------|
| `user_id` | INT (PK) | Unique user identifier |
| `first_name`, `last_name` | VARCHAR | User’s personal details |
| `email` | VARCHAR (UNIQUE) | Used for authentication |
| `password` | VARCHAR | Hashed password |
| `phone_number` | VARCHAR | Optional contact number |
| `role` | ENUM | Defines user type (`guest`, `host`, `admin`) |
| `created_at` | TIMESTAMP | Account creation time |

**Relationship:**  
- One user can host many properties.  
- One user can make many bookings.  
- One user can send and receive many messages.

---

### **2. Properties Table**
Represents listings created by hosts.

| Column | Type | Description |
|--------|------|-------------|
| `property_id` | INT (PK) | Unique property identifier |
| `host_id` | INT (FK) | References `users.user_id` |
| `name` | VARCHAR | Property title |
| `description` | TEXT | Details about the property |
| `location` | VARCHAR | Address or city |
| `price_per_night` | DECIMAL | Price per night |
| `created_at` | TIMESTAMP | Creation timestamp |
| `updated_at` | TIMESTAMP | Auto-updated timestamp |

**Relationship:**  
- Each property belongs to **one host (user)**.  
- One property can have **many bookings** and **many reviews**.

---

### **3. Bookings Table**
Tracks reservations made by users.

| Column | Type | Description |
|--------|------|-------------|
| `booking_id` | INT (PK) | Unique booking identifier |
| `user_id` | INT (FK) | Guest making the booking |
| `property_id` | INT (FK) | Booked property |
| `start_date`, `end_date` | DATE | Booking period |
| `total_price` | DECIMAL | Computed cost |
| `status` | ENUM | Booking state (`pending`, `confirmed`, `cancelled`) |
| `created_at` | TIMESTAMP | Booking creation date |

**Relationship:**  
- A user can have multiple bookings.  
- A property can have multiple bookings.  
- Each booking can have **one payment**.

---

### **4. Payments Table**
Handles payments made for bookings.

| Column | Type | Description |
|--------|------|-------------|
| `payment_id` | INT (PK) | Unique payment identifier |
| `booking_id` | INT (FK, UNIQUE) | Associated booking |
| `amount` | DECIMAL | Payment amount |
| `payment_date` | TIMESTAMP | Payment timestamp |
| `payment_method` | ENUM | Method used (`credit_card`, `paypal`, `crypto`, `bank_transfer`) |
| `status` | ENUM | Payment state (`pending`, `completed`, `failed`) |

**Relationship:**  
- One-to-one with `bookings` (each booking has one payment).

---

### **5. Reviews Table**
Stores user feedback on properties.

| Column | Type | Description |
|--------|------|-------------|
| `review_id` | INT (PK) | Unique review ID |
| `user_id` | INT (FK) | Reviewer |
| `property_id` | INT (FK) | Reviewed property |
| `rating` | INT | Star rating (1–5) |
| `comment` | TEXT | Review text |
| `created_at` | TIMESTAMP | Review date |

**Relationship:**  
- Many users can review many properties (many-to-one on both sides).

---

### **6. Messages Table**
Manages direct messages between users (hosts, guests, admins).

| Column | Type | Description |
|--------|------|-------------|
| `message_id` | INT (PK) | Unique message identifier |
| `sender_id` | INT (FK) | Message sender |
| `recipient_id` | INT (FK) | Message receiver |
| `message_body` | TEXT | Content of the message |
| `sent_at` | TIMESTAMP | Timestamp when message was sent |

**Relationship:**  
- One user can send many messages.  
- One user can receive many messages.  
- Messages persist even if the user is deleted (`ON DELETE SET NULL`).

---

## **Relationship Summary**

| Table | Related Table | Relationship Type |
|--------|----------------|------------------|
| Users → Properties | One-to-Many | One host can list multiple properties |
| Users → Bookings | One-to-Many | One user can make multiple bookings |
| Properties → Bookings | One-to-Many | Each property can have multiple bookings |
| Bookings → Payments | One-to-One | Each booking has exactly one payment |
| Users → Reviews | One-to-Many | One user can write multiple reviews |
| Properties → Reviews | One-to-Many | Each property can have many reviews |
| Users ↔ Messages | One-to-Many (bi-directional) | Users can send and receive multiple messages |

---

## ** Indexing**
- **Primary Keys** are automatically indexed.  
- **Additional Indexes:**  
  - `email` in the `users` table  
  - `property_id` in the `bookings` and `reviews` tables  
  - `booking_id` in the `payments` table  

---

## ** Constraints**
- **Foreign keys** ensure referential integrity.  
- **ENUM types** restrict invalid data entries.  
- **CHECK constraint** ensures ratings are between 1–5.  
- **ON DELETE CASCADE / SET NULL** maintain consistency across relationships.

---

## ** How to Run**
1. Open MySQL terminal or client.  
2. Run:
   ```sql
   SOURCE path/to/schema.sql;
