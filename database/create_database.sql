CREATE TABLE IF NOT EXISTS post (
  id INT AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(200),
  street_number VARCHAR(5),
  floor VARCHAR(3),
  apartment VARCHAR(2),
  city VARCHAR(50),
  zipcode VARCHAR(10),
  country VARCHAR(5),
  landlord_phone VARCHAR(20),
  landlord_email VARCHAR(100),
  landlord_name VARCHAR(100),
  created_on TIMESTAMP,
  updated_on TIMESTAMP
)