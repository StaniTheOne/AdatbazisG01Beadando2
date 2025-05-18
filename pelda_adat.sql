INSERT INTO cars (brand, model, year, price, is_sold) VALUES
('Toyota', 'Corolla', 2018, 5200000, FALSE),
('Honda', 'Civic', 2019, 5600000, TRUE),
('Ford', 'Focus', 2017, 4800000, TRUE),
('BMW', '320i', 2020, 8900000, FALSE),
('Mercedes', 'A-Class', 2021, 9500000, TRUE),
('Audi', 'A4', 2019, 8700000, FALSE),
('Skoda', 'Octavia', 2016, 4100000, TRUE),
('Volkswagen', 'Golf', 2020, 6200000, FALSE),
('Kia', 'Ceed', 2022, 6100000, FALSE),
('Hyundai', 'i30', 2023, 6400000, FALSE);

INSERT INTO customers (name, email, phone) VALUES
('Kovács Béla', 'bela.kovacs@example.com', '+36201234567'),
('Nagy Anna', 'anna.nagy@example.com', '+36203334455'),
('Tóth Gábor', 'gabor.toth@example.com', '+36301234567'),
('Szabó Katalin', 'kata.szabo@example.com', '+36205556677'),
('Varga Péter', 'peter.varga@example.com', '+36207778899'),
('Kiss László', 'laszlo.kiss@example.com', '+36309998888'),
('Fekete Dóra', 'dora.fekete@example.com', '+36204445566'),
('Molnár Ádám', 'adam.molnar@example.com', '+36301112233'),
('Simon Réka', 'reka.simon@example.com', '+36202223344'),
('Bálint Zsolt', 'zsolt.balint@example.com', '+36201110000');

INSERT INTO salespersons (name, phone, level) VALUES
('Szalai Tamás', '+36208889999', 4),
('Lukács Judit', '+36304445577', 3),
('Fodor András', '+36203331122', 2),
('Papp Mária', '+36206667788', 5),
('Oláh Bence', '+36301110011', 1),
('Horváth Csilla', '+36303332211', 3),
('Tóth Zsombor', '+36207778811', 2);

INSERT INTO sales (car_id, customer_id, salesperson_id, sale_date, sale_price) VALUES
(2, 1, 1, '2024-02-15', 5550000),
(3, 2, 2, '2024-03-01', 4700000),
(5, 3, 4, '2024-04-10', 9400000),
(7, 4, 3, '2023-12-20', 4000000);

INSERT INTO service (car_id, service_date, description, cost) VALUES
(1, '2023-11-05', 'Olajcsere és fékellenőrzés', 45000),
(2, '2023-09-15', 'Gumiabroncs csere', 70000),
(3, '2024-01-10', 'Féktárcsa csere', 120000),
(4, '2024-03-20', 'Rendszeres szerviz', 60000),
(5, '2024-05-01', 'Légkondi tisztítás', 25000),
(6, '2024-04-10', 'Első lengéscsillapítók cseréje', 95000),
(7, '2023-10-30', 'Motorvezérlés ellenőrzés', 80000),
(8, '2024-05-10', 'Teljes átvizsgálás', 50000);