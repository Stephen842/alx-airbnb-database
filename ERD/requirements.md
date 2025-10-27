# Airbnb Database ER Diagram

## Overview
This document defines the entities and relationships for the Airbnb database system, designed to manage users, properties, bookings, payments, reviews, and messages.

## Entities and Attributes
1. **User**
   - user_id (PK)
   - first_name, last_name, email (unique), password_hash, phone_number
   - role (guest, host, admin)
   - created_at

2. **Property**
   - property_id (PK)
   - host_id (FK → User.user_id)
   - name, description, location, pricepernight
   - created_at, updated_at

3. **Booking**
   - booking_id (PK)
   - property_id (FK → Property.property_id)
   - user_id (FK → User.user_id)
   - start_date, end_date, total_price, status
   - created_at

4. **Payment**
   - payment_id (PK)
   - booking_id (FK → Booking.booking_id)
   - amount, payment_method, payment_date

5. **Review**
   - review_id (PK)
   - property_id (FK → Property.property_id)
   - user_id (FK → User.user_id)
   - rating, comment, created_at

6. **Message**
   - message_id (PK)
   - sender_id (FK → User.user_id)
   - recipient_id (FK → User.user_id)
   - message_body, sent_at

## Relationships
- A **User** can host many **Properties**
- A **User** can make many **Bookings**
- A **Booking** belongs to one **Property** and one **User**
- A **Booking** has one **Payment**
- A **User** can write many **Reviews** for **Properties**
- A **User** can send and receive many **Messages**

