-- Find all hedgehogs from a given shelter
SELECT "name", "age", "mass", "date_of_placement" FROM "hedgehogs"
WHERE "id" IN (
    SELECT "hedgehog id" FROM "hedgehogs_workers_in_shelters_view"
    WHERE "shelter name" = 'Happy Haven'
)
ORDER BY "name" ASC, "date_of_placement" ASC;

-- Find all workers from a given shelter
SELECT "worker first name", "worker last name" FROM "hedgehogs_workers_in_shelters_view"
WHERE "shelter name" = 'Happy Haven'
GROUP BY "worker id"
ORDER BY "worker first name" ASC, "worker last name" ASC;

--Find all hedgehogs guarded by the given worker
SELECT "shelter name", "hedgehog name" FROM "hedgehogs_workers_in_shelters_view"
WHERE "worker first name" = 'John'
AND "worker last name" = 'Doe'
ORDER BY "shelter name" ASC, "hedgehog name" ASC;

-- Find all shelters in a given city
SELECT "name", "address" FROM "shelters"
WHERE "city" = 'New York';

-- Find shelters that need funding the most according to funds per hedgehog
SELECT "name", "city", "address",
"funds"/COUNT("hedgehog_id") AS "funds per hedgehog" FROM "hedgehogs_in_shelters"
JOIN "shelters" ON "shelters"."id" = "hedgehogs_in_shelters"."shelter_id"
GROUP BY "shelters"."name"
ORDER BY "funds per hedgehog" ASC, "shelters"."name" ASC;

-- Find all expired food in shelters
SELECT "shelter name", "food name", "amount", "expires" FROM "food_in_shelters_view"
WHERE "expires" <= CURRENT_DATE
GROUP BY "expire id"
ORDER BY "shelters name" ASC, "food name" ASC, "amount" DESC;

-- Find all expired medicine in shelters
SELECT "shelter name", "medicine name", "amount", "expires" FROM "hedgehogs_medicine_in_shelters_view"
WHERE "expires" <= CURRENT_DATE
GROUP BY "expire id"
ORDER BY "shelters name" ASC, "medicine name" ASC, "amount" DESC;

-- Find all medicine that needs a given hedgehog in a given shelter
SELECT DISTINCT "medicine name" FROM "hedgehogs_medicine_in_shelters_view"
WHERE "hedgehog name" = "Sonic"
AND "shelter name" = 'Happy Haven';


-- Insert some data
INSERT INTO "workers" ("id", "first_name", "last_name") VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson'),
(4, 'Emily', 'Williams'),
(5, 'Christopher', 'Brown');


INSERT INTO "hedgehogs" ("id", "name", "age", "mass", "date_of_placement") VALUES
(1, 'Sonic', 3, 1.2, '2023-02-15'),
(2, 'Spiky', 2, 0.8, '2023-03-20'),
(3, 'Quill', 1, 1.5, '2022-12-10'),
(4, 'Huffy', 4, 2.2, '2023-01-05'),
(5, 'Prickles', 2, 1.0, '2023-04-18');



INSERT INTO "shelters" ("id", "name", "country", "city", "ZIP-code", "address", "funds") VALUES
(1, 'Happy Haven', 'United States', 'New York', 10001, '123 Main Street', 5000.00),
(2, 'Cozy Critters', 'United States', 'Los Angeles', 90001, '456 Elm Street', 7500.00),
(3, 'Furry Friends Shelter', 'United States', 'Chicago', 60601, '789 Oak Avenue', 3000.00),
(4, 'Warm Paws Rescue', 'United States', 'Houston', 77001, '101 Pine Road', 6000.00),
(5, 'Cuddle Corner', 'United States', 'Miami', 33101, '222 Maple Lane', 4000.00);


INSERT INTO "food" ("id", "name", "comment") VALUES
(1, 'Mealworms', 'High in protein'),
(2, 'Fruits', 'Assorted fruits'),
(3, 'Vegetables', 'Fresh vegetables'),
(4, 'Insects', 'Variety of insects'),
(5, 'Pellets', 'Nutritious pellet diet');


INSERT INTO "medicine" ("id", "name", "comment") VALUES
(1, 'Antibiotics', 'For bacterial infections'),
(2, 'Anti-inflammatory', 'Reduces inflammation'),
(3, 'Antifungal', 'Treats fungal infections'),
(4, 'Pain reliever', 'Relieves pain'),
(5, 'Vitamins', 'Supplements for health');


INSERT INTO "hedgehogs_workers" ("id", "hedgehog_id", "worker_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);



INSERT INTO "shelter_workers" ("id", "shelter_id", "worker_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);


INSERT INTO "hedgehogs_medicine" ("id", "hedgehog_id", "medicine_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);



INSERT INTO "hedgehogs_in_shelters" ("id", "hedgehog_id", "shelter_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);



INSERT INTO "shelters_medicine" ("id", "shelter_id", "medicine_id", "amount", "expires") VALUES
(1, 1, 1, 50, '2024-02-01'),
(2, 2, 2, 30, '2024-05-15'),
(3, 3, 3, 20, '2024-07-10'),
(4, 4, 4, 40, '2024-06-30'),
(5, 5, 5, 25, '2024-02-20');



INSERT INTO "shelters_food" ("id", "shelter_id", "food_id", "amount", "expires") VALUES
(1, 1, 1, 100, '2024-06-01'),
(2, 2, 2, 80, '2024-02-15'),
(3, 3, 3, 60, '2024-07-10'),
(4, 4, 4, 120, '2024-02-30'),
(5, 5, 5, 75, '2024-05-20');
