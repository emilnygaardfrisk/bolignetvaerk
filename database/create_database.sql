CREATE DATABASE bolignetvaerk;
USE bolignetvaerk;
CREATE TABLE IF NOT EXISTS post (
  id INT AUTO_INCREMENT PRIMARY KEY,
	
	-- apartment information
	size_m2 SMALLINT,
	nr_rooms SMALLINT,
	price INT,
	accomodation_type VARCHAR(10), -- enum
	availability_type VARCHAR(10), -- enum
	months_available SMALLINT,
	
	-- image paths
	img_path_0 VARCHAR(300),
	img_path_1 VARCHAR(300),
	img_path_2 VARCHAR(300),
	img_path_3 VARCHAR(300),
	img_path_4 VARCHAR(300),
	img_path_5 VARCHAR(300),
	img_path_6 VARCHAR(300),
	img_path_7 VARCHAR(300),
	img_path_8 VARCHAR(300),
	img_path_9 VARCHAR(300),

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

	user_key VARCHAR(36), -- guid
  created_on TIMESTAMP,
  updated_on TIMESTAMP
);
