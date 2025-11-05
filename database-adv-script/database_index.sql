-- Index on users email for faster authentication queries
CREATE INDEX idx_users_email
ON users(email);

-- Index on properties.owner_id for faster joins with users
CREATE INDEX idx_properties_owner
ON properties(owner_id);

-- Index on bookings.user_id for faster retrieval of bookings by user
CREATE INDEX idx_bookings_user
ON bookings(user_id);

-- Index on bookings.property_id for faster property-bookings lookup
CREATE INDEX idx_bookings_property
ON bookings(property_id);
