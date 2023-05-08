-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-07 20:42:28.575

-- tables
-- Table: auto
CREATE TABLE auto (
    id integer NOT NULL CONSTRAINT auto_pk PRIMARY KEY,
    brand text NOT NULL,
    Start_mileage real NOT NULL,
    Load_copasity real NOT NULL
);

-- Table: driver
CREATE TABLE driver (
    id integer NOT NULL CONSTRAINT driver_pk PRIMARY KEY,
    last_name text NOT NULL,
    category text NOT NULL,
    expearence integer NOT NULL,
    address text NOT NULL,
    birth_year date NOT NULL
);

-- Table: rent_order
CREATE TABLE rent_order (
    id integer NOT NULL CONSTRAINT rent_order_pk PRIMARY KEY,
    date date NOT NULL,
    driver_id integer NOT NULL,
    auto_id integer NOT NULL,
    mileage real NOT NULL,
    weight real NOT NULL,
    price real NOT NULL,
    CONSTRAINT order_driver FOREIGN KEY (driver_id)
    REFERENCES driver (id),
    CONSTRAINT order_auto FOREIGN KEY (auto_id)
    REFERENCES auto (id)
);

-- Table: user
CREATE TABLE user (
    id integer NOT NULL CONSTRAINT user_pk PRIMARY KEY,
    login text NOT NULL,
    HPasword text NOT NULL,
    admRule boolean NOT NULL,
    driver_id integer,
    CONSTRAINT user_driver FOREIGN KEY (driver_id)
    REFERENCES driver (id)
);

-- Заполнение таблицы auto
INSERT INTO auto (id, brand, Start_mileage, Load_copasity)
VALUES
    (1, 'Toyota', 10000, 1500),
    (2, 'Honda', 20000, 1200),
    (3, 'Ford', 30000, 1700),
    (4, 'Chevrolet', 40000, 1400),
    (5, 'Nissan', 50000, 1100),
    (6, 'Mazda', 60000, 1300),
    (7, 'Kia', 75000, 1600),
    (8, 'Hyundai', 80000, 1800),
    (9, 'Volkswagen', 9000, 1900),
    (10, 'BMW', 100, 2000),
    (11, 'Mercedes-Benz', 11000, 2200),
    (12, 'Audi', 12000, 2300),
    (13, 'Lexus', 1300, 2400),
    (14, 'Infiniti', 0, 2500),
    (15, 'Tesla', 15000, 2600),
    (16, 'Porsche', 16000, 2700),
    (17, 'Ferrari', 17000, 2800),
    (18, 'Lamborghini', 18000, 2900),
    (19, 'Bugatti', 19000, 3000),
    (20, 'McLaren', 20000, 3100);

-- Заполнение таблицы driver
INSERT INTO driver (id, last_name, category, expearence, address, birth_year)
VALUES
    (1, 'Smith', 'A', 3, '123 Main St', '1990-01-01'),
    (2, 'Johnson', 'A', 5, '456 Elm St', '1985-01-01'),
    (3, 'Williams', 'B', 7, '789 Oak St', '1980-01-01'),
    (4, 'Jones', 'B', 9, '321 Maple St', '1975-01-01'),
    (5, 'Brown', 'C', 11, '654 Pine St', '1970-01-01'),
    (6, 'Davis', 'C', 13, '987 Cedar St', '1965-01-01'),
    (7, 'Miller', 'A', 15, '159 Birch St', '1960-01-01'),
    (8, 'Wilson', 'A', 17, '753 Spruce St', '1955-01-01'),
    (9, 'Moore', 'B', 19, '246 Fir St', '1950-01-01'),
    (10, 'Taylor', 'B', 21, '369 Pineapple St', '1945-01-01'),
    (11, 'Anderson', 'C', 23, '852 Mango St', '1940-01-01'),
    (12, 'Jackson', 'C', 25, '147 Banana St', '1935-01-01');

-- Заполнение таблицы user
INSERT INTO user (id, login, HPasword, admRule, driver_id)
VALUES
    (1, 'user1', '916667321108f9b35c76f5f3c19c863d9b922193b847d2f8ca5ec83f218cfb82', FALSE, 1),
    (2, 'user2', '87bc38d58c2a371ad982d9b2baeae01502177bddec9cd6a5ec19b64534bbf43c', FALSE, 2),
    (3, 'user3', '06a204bef1c0b2446d2bc2f8dc5b91389ddcdc618cf55974705fd048a16ea53a', FALSE, 3),
    (4, 'user4', '1bd921f07dd3eeaf72038c79f5d544739604b7c00619b1fe58b9da7805897a32', FALSE, 4),
    (5, 'user5', 'eb5dfe90bc4c7c54286e473ec7cf69c1f533d03874304dfd21aa76168b8ed2bd', FALSE, 5),
    (6, 'user6', '7f6432fc930da9342060b73b1d92b00ef6305715ee4c28d79e24560f4a15fbbf', FALSE, 6),
    (7, 'user7', '5bf65af0e0c64c7acc4e9c7c6db774b123e6e11164757745070121bdd2e4d24a', FALSE, 7),
    (8, 'user8', '4b3b8b90a606390f9a2d28184d2b4c72cf59b1bda938c53c355d5d436688b59e', FALSE, 8),
    (9, 'user9', 'dc847a1f062392b15ee1d307e09af426dc3cfc7385f309f0a862e0a36fd1c4a6', FALSE, 9),
    (10, 'user10', '53478b3bd2c53a295e0ac3aa11ac6857e641c185517dfa935c76408db82797c6', FALSE, 10),
    (11, 'user11', 'f5d23abfe510e3e87cb80d708cb811541937f0915c50b799d54cbd03c09bf638', FALSE, 11),
    (12, 'use', 'a3b142af6e97cfc3bb23e409ab83467af7d16ded7dc0632be6a6a9023e49ce8b', FALSE, 12),
    (13, 'admin1', '238075fe6cf4c6ad1830292091915cf647a3858cd8c0641f055de80b4684d6be', TRUE, NULL),
    (14, 'admin2', '618b6c206d3e94f52d79360121cc5cfa58eb76e40773d3b8e8476a834ea99b8d', TRUE, NULL),
    (15, 'adm', '86f65e28a754e1a71b2df9403615a6c436c32c42a75a10d02813961b86f1e428', TRUE, NULL);

-- Заполнение таблицы rent_order
INSERT INTO rent_order (id, date, driver_id, auto_id, mileage, weight, price)
VALUES
    (1, '2023-05-01', 1, 1, 12000, 2000, 800),
    (2, '2023-05-02', 2, 2, 22000, 1500, 700),
    (3, '2023-05-03', 3, 3, 32000, 1800, 900),
    (4, '2023-05-04', 4, 4, 42000, 1300, 600),
    (5, '2023-05-05', 5, 5, 52000, 1600, 1000),
    (6, '2023-05-06', 6, 6, 62000, 1200, 500),
    (7, '2023-05-07', 7, 7, 72000, 1900, 1200),
    (8, '2023-05-08', 8, 8, 82000, 1700, 1100),
    (9, '2023-05-09', 9, 9, 92000, 1400, 800),
    (10, '2023-05-10', 10, 10, 102000, 2000, 1500),
    (11, '2023-05-11', 11, 11, 112000, 2200, 1800),
    (12, '2023-05-12', 12, 12, 122000, 2300, 1900),
    (13, '2023-05-13', 1, 13, 132000, 2400, 2000),
    (14, '2023-05-14', 2, 14, 142000, 2500, 2100),
    (15, '2023-05-15', 3, 15, 152000, 2600, 2200);
-- End of file.

