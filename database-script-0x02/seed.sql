-- SEED DATA FOR AIRBNB_DB
USE airbnb_db;

-- Insert Users
INSERT INTO users (first_name, last_name, email, password, phone_number, role)
VALUES
('John', 'Doe', 'john.doe@example.com', 'hashed_password1', '+1234567890', 'host'),
('Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '+1987654321', 'guest'),
('Mark', 'Johnson', 'mark.johnson@example.com', 'hashed_password3', '+1222333444', 'guest'),
('Alice', 'Williams', 'alice.williams@example.com', 'hashed_password4', '+1444555666', 'host'),
('Admin', 'User', 'admin@airbnb.com', 'hashed_admin_password', '+1555777888', 'admin');

-- Insert Properties
INSERT INTO properties (host_id, name, description, location, price_per_night)
VALUES
(1, 'Cozy Studio Apartment', 'A comfortable studio in the city center.', 'New York, USA', 80.00),
(1, 'Beachfront Villa', 'Luxury villa facing the sea with private pool.', 'Miami, USA', 350.00),
(4, 'Mountain Cabin', 'A peaceful cabin with beautiful mountain views.', 'Denver, USA', 120.00),
(4, 'Downtown Loft', 'Modern loft apartment near public transport.', 'Los Angeles, USA', 150.00);

-- Insert Bookings
INSERT INTO bookings (user_id, property_id, start_date, end_date, total_price, status)
VALUES
(2, 1, '2025-11-01', '2025-11-05', 320.00, 'confirmed'),
(3, 2, '2025-12-10', '2025-12-15', 1750.00, 'pending'),
(2, 3, '2025-10-20', '2025-10-23', 360.00, 'cancelled');

-- Insert Payments
INSERT INTO payments (booking_id, amount, payment_date, payment_method, status)
VALUES
(1, 320.00, '2025-10-25 09:30:00', 'credit_card', 'completed'),
(2, 1750.00, '2025-12-09 10:00:00', 'paypal', 'pending'),
(3, 360.00, '2025-10-18 12:00:00', 'bank_transfer', 'failed');

-- Insert Reviews
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Amazing stay! The host was friendly and the location was perfect.'),
(3, 2, 4, 'Beautiful view but a bit expensive.'),
(2, 3, 3, 'Nice cabin, but limited amenities.');

-- Insert Messages
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
(2, 1, 'Hi John, is your apartment available for next weekend?'),
(1, 2, 'Hello Jane, yes it’s available. You can book directly on the site.'),
(3, 4, 'Hi Alice, I’d like to know if your cabin allows pets.'),
(4, 3, 'Hello Mark, yes, pets are welcome in the cabin!');