DROP TABLE IF EXISTS properties;


CREATE TABLE properties (
	id SERIAL8 PRIMARY KEY,
	address VARCHAR(255),
  value INT,
	number_of_bedrooms INT,
	year_built INT
);
