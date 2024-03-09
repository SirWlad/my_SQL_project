INSERT INTO workers (id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson'),
(4, 'Emily', 'Williams'),
(5, 'Christopher', 'Brown');


INSERT INTO hedgehogs (id, name, age, mass, date_of_placement) VALUES
(1, 'Sonic', 3, 1.2, '2023-02-15'),
(2, 'Spiky', 2, 0.8, '2023-03-20'),
(3, 'Quill', 1, 1.5, '2022-12-10'),
(4, 'Huffy', 4, 2.2, '2023-01-05'),
(5, 'Prickles', 2, 1.0, '2023-04-18'),
(6, 'Prickly', 3, 1.8, '2024-02-10'),
(7, 'Quills', 2, 1.1, '2024-03-15'),
(8, 'Spikes', 1, 0.9, '2024-01-20'),
(9, 'Spike', 4, 2.3, '2024-04-05'),
(10, 'Needle', 2, 1.5, '2024-05-20'),
(11, 'Prick', 3, 1.8, '2024-06-10'),
(12, 'Quilliam', 2, 1.1, '2024-07-15'),
(13, 'Spikester', 1, 0.9, '2024-08-20'),
(14, 'Needleton', 4, 2.3, '2024-09-05'),
(15, 'Spiky Jr.', 2, 1.5, '2024-10-20');


INSERT INTO shelters (id, name, country, city, "ZIP-code", address, funds) VALUES
(1, 'Happy Haven', 'United States', 'New York', 10001, '123 Main Street', 5000.00),
(2, 'Cozy Critters', 'United States', 'Los Angeles', 90001, '456 Elm Street', 7500.00),
(3, 'Furry Friends Shelter', 'United States', 'Chicago', 60601, '789 Oak Avenue', 3000.00),
(4, 'Warm Paws Rescue', 'United States', 'Houston', 77001, '101 Pine Road', 6000.00),
(5, 'Cuddle Corner', 'United States', 'Miami', 33101, '222 Maple Lane', 4000.00);


INSERT INTO food (id, name, comment) VALUES
(1, 'Mealworms', 'High in protein'),
(2, 'Fruits', 'Assorted fruits'),
(3, 'Vegetables', 'Fresh vegetables'),
(4, 'Insects', 'Variety of insects'),
(5, 'Pellets', 'Nutritious pellet diet');


INSERT INTO medicine (id, name, comment) VALUES
(1, 'Antibiotics', 'For bacterial infections'),
(2, 'Anti-inflammatory', 'Reduces inflammation'),
(3, 'Antifungal', 'Treats fungal infections'),
(4, 'Pain reliever', 'Relieves pain'),
(5, 'Vitamins', 'Supplements for health');


INSERT INTO hedgehogs_workers (id, hedgehog_id, worker_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 4),
(10, 10, 5),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 5);


INSERT INTO shelter_workers (id, shelter_id, worker_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);


INSERT INTO hedgehogs_medicine (id, hedgehog_id, medicine_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 4),
(10, 10, 5),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 5);


INSERT INTO hedgehogs_in_shelters (id, hedgehog_id, shelter_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 4),
(10, 10, 5),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 5);


INSERT INTO shelters_medicine (id, shelter_id, medicine_id, amount, expires) VALUES
(1, 1, 1, 50, '2024-06-01'),
(2, 2, 2, 30, '2024-05-15'),
(3, 3, 3, 20, '2024-07-10'),
(4, 4, 4, 40, '2024-06-30'),
(5, 5, 5, 25, '2024-05-20'),
(6, 1, 1, 40, '2024-06-01'),
(7, 2, 2, 25, '2024-05-15'),
(8, 3, 3, 15, '2024-07-10'),
(9, 4, 4, 30, '2024-06-30'),
(10, 5, 5, 20, '2024-07-20'),
(11, 1, 1, 40, '2024-08-01'),
(12, 2, 2, 25, '2024-09-15'),
(13, 3, 3, 15, '2024-10-10'),
(14, 4, 4, 30, '2024-11-30'),
(15, 5, 5, 20, '2024-12-20');


INSERT INTO shelters_food (id, shelter_id, food_id, amount, expires) VALUES
(1, 1, 1, 100, '2024-06-01'),
(2, 2, 2, 80, '2024-05-15'),
(3, 3, 3, 60, '2024-07-10'),
(4, 4, 4, 120, '2024-06-30'),
(5, 5, 5, 75, '2024-05-20'),
(6, 1, 1, 80, '2024-06-01'),
(7, 2, 2, 60, '2024-05-15'),
(8, 3, 3, 40, '2024-07-10'),
(9, 4, 4, 100, '2024-06-30'),
(10, 5, 5, 75, '2024-07-20'),
(11, 1, 1, 80, '2024-08-01'),
(12, 2, 2, 60, '2024-09-15'),
(13, 3, 3, 40, '2024-10-10'),
(14, 4, 4, 100, '2024-11-30'),
(15, 5, 5, 75, '2024-12-20');
