CREATE TABLE IF NOT EXISTS post (
  id INT AUTO_INCREMENT PRIMARY KEY,
	
	-- apartment information
	size_m2 SMALLINT,
	nr_rooms SMALLINT,
	price INT,
	accomodation_type VARCHAR(10), -- enum
	availability_type VARCHAR(10), -- enum
	months_available SMALLINT,

	-- address
  street VARCHAR(200),
  street_number VARCHAR(5),
  floor VARCHAR(3),
  apartment VARCHAR(2),
  city VARCHAR(50),
  zipcode VARCHAR(10),
  country VARCHAR(5),

	-- landlord information
  landlord_phone VARCHAR(20),
  landlord_email VARCHAR(100),
  landlord_name VARCHAR(100),

	key VARCHAR(36), -- guid
  created_on TIMESTAMP,
  updated_on TIMESTAMP,
)
