CREATE DATABASE salon;

\c salon

CREATE TABLE appointments (
    appointment_id SERIAL      NOT NULL,
    customer_id    INTEGER     NOT NULL,
    service_id     INTEGER     NOT NULL,
    time           VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL      NOT NULL,
    name	      VARCHAR(50) NOT NULL,
    phone       VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE services (
    service_id SERIAL      NOT NULL,
    name       VARCHAR(50) NOT NULL
);

INSERT INTO services VALUES
(1, 'cut'  ), (2, 'color'), (3, 'perm' ), (4, 'style'), (5, 'trim');

ALTER TABLE appointments ADD PRIMARY KEY (appointment_id);
ALTER TABLE services     ADD PRIMARY KEY (service_id);
ALTER TABLE customers    ADD PRIMARY KEY (customer_id);
ALTER TABLE appointments ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
ALTER TABLE appointments ADD FOREIGN KEY (service_id)  REFERENCES services  (service_id);
