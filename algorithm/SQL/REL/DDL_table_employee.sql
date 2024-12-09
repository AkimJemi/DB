DROP SEQUENCE IF EXISTS employee.person_seq CASCADE; 

CREATE SEQUENCE IF NOT EXISTS employee.person_seq 
START WITH
    1 INCREMENT BY
    1; 

CREATE TABLE IF NOT EXISTS employee.ep_person( 
    id INTEGER DEFAULT nextval('employee.person_seq') PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    position TEXT,
    department TEXT,
    hire_date DATE,
    salary NUMERIC(15, 2),
    phone_number VARCHAR(15),
    email VARCHAR(255),
    address TEXT,
    company_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
