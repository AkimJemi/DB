DROP SEQUENCE IF EXISTS common.cm_address_seq CASCADE; 

CREATE SEQUENCE common.cm_address_seq 
START WITH
    1 INCREMENT BY
    1; 

DROP TABLE IF EXISTS common.cm_address; 

CREATE TABLE IF NOT EXISTS common.cm_address( 
    id INTEGER DEFAULT nextval('common.cm_address_seq') PRIMARY KEY
    , type TEXT NOT NULL
    , type_id INTEGER NOT NULL
    , address_street TEXT
    , address_city TEXT
    , address_state TEXT
    , address_postal_code VARCHAR (20)
    , address_country TEXT
    , phone_country_code VARCHAR (5)
    , phone_number VARCHAR (15)
    , email VARCHAR (255)
    , created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    , updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

DROP SEQUENCE IF EXISTS common.cm_person_seq CASCADE; 

CREATE SEQUENCE IF NOT EXISTS common.cm_person_seq 
START WITH
    1 INCREMENT BY
    1; 

DROP TABLE IF EXISTS common.cm_person CASCADE; 


CREATE TABLE IF NOT EXISTS common.cm_person(
    id INTEGER DEFAULT nextval('common.cm_person_seq') PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    middle_name TEXT,
    gender TEXT CHECK (gender IN ('Male', 'Female', 'Other')),
    date_of_birth DATE NOT NULL,
    nationality TEXT NOT NULL,
    passport_number VARCHAR(20),
    marital_status TEXT CHECK ( 
        marital_status IN ('Single', 'Married', 'Divorced', 'Widowed')
    ),
    spouse_name TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
