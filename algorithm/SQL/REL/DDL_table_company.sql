DROP SEQUENCE IF EXISTS company.cp_basic_info CASCADE; 

CREATE SEQUENCE IF NOT EXISTS company.cp_basic_info_seq 
START WITH
    1 INCREMENT BY
    1; 

DROP TABLE IF EXISTS company.cp_basic_info; 

CREATE TABLE IF NOT EXISTS company.cp_basic_info( 
    id integer DEFAULT nextval('company.cp_basic_info') PRIMARY KEY,
    name TEXT NOT NULL, 
    industry TEXT, 
    established_date DATE, 
    ceo_name TEXT, 
    headquarters TEXT, 
    employees_count INTEGER, 
    annual_revenue NUMERIC(15, 2), 
    phone_number VARCHAR(15), 
    email VARCHAR(255), 
    website_url TEXT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

