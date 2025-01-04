CREATE DATABASE telecom_db
    WITH 
    OWNER = your_db_user
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TEMPLATE = template0;

\c telecom_db;

CREATE TABLE Operator (
    operator_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    operator_code VARCHAR(50) UNIQUE NOT NULL,
    number_count INTEGER NOT NULL
);

CREATE TABLE Subscriber (
    subscriber_id SERIAL PRIMARY KEY,
    passport_data VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE Connection (
    connection_id SERIAL PRIMARY KEY,
    operator_id INTEGER REFERENCES Operator(operator_id) ON DELETE CASCADE,
    subscriber_id INTEGER REFERENCES Subscriber(subscriber_id) ON DELETE CASCADE,
    number VARCHAR(50) NOT NULL,
    tariff_plan VARCHAR(255),
    debt DECIMAL(10, 2) DEFAULT 0,
    installation_date DATE NOT NULL
);
