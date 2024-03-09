-- Represent workers in shelters
CREATE TABLE "workers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent hedgehogs in shelters
CREATE TABLE "hedgehogs" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "age" INTEGER,
    "mass" NUMERIC,
    "date_of_placement" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

-- Represent shelters for hedgehogs
CREATE TABLE "shelters" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "ZIP-code" NUMERIC NOT NULL,
    "address" TEXT NOT NULL,
    "funds" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

-- Represent food types in shelters
CREATE TABLE "food" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "comment" TEXT,
    PRIMARY KEY("id")
);

-- Represent types of the medicine in shelters
CREATE TABLE "medicine" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "comment" TEXT,
    PRIMARY KEY("id")
);

-- Represent workers that carrying on hedgehogs
CREATE TABLE "hedgehogs_workers" (
    "id" INTEGER,
    "hedgehog_id" NUMERIC,
    "worker_id" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("hedgehog_id") REFERENCES "hedgehogs"("id"),
    FOREIGN KEY("worker_id") REFERENCES "workers"("id")
);

-- Represent connections between shelters and workers
CREATE TABLE "shelter_workers" (
    "id" INTEGER,
    "shelter_id" NUMERIC,
    "worker_id" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("shelter_id") REFERENCES "shelters"("id"),
    FOREIGN KEY("worker_id") REFERENCES "workers"("id")
);

-- Represent what medicine the hedgehog needs
CREATE TABLE "hedgehogs_medicine" (
    "id" INTEGER,
    "hedgehog_id" NUMERIC,
    "medicine_id" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("hedgehog_id") REFERENCES "hedgehogs"("id"),
    FOREIGN KEY("medicine_id") REFERENCES "medicine"("id")
);

-- Represent in what shelter hedgehog living
CREATE TABLE "hedgehogs_in_shelters" (
    "id" INTEGER,
    "hedgehog_id" NUMERIC,
    "shelter_id" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("hedgehog_id") REFERENCES "hedgehogs"("id"),
    FOREIGN KEY("shelter_id") REFERENCES "shelters"("id")
);

-- Represent what medicine and how much is in the shelter
CREATE TABLE "shelters_medicine" (
    "id" INTEGER,
    "shelter_id" NUMERIC,
    "medicine_id" NUMERIC,
    "amount" NUMERIC,
    "expires" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("shelter_id") REFERENCES "shelters"("id")
    FOREIGN KEY("medicine_id") REFERENCES "medicine"("id")
);

-- Represent what food and how much is in the shelter
CREATE TABLE "shelters_food" (
    "id" INTEGER,
    "shelter_id" NUMERIC,
    "food_id" NUMERIC,
    "amount" NUMERIC,
    "expires" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("shelter_id") REFERENCES "shelters"("id")
    FOREIGN KEY("food_id") REFERENCES "food"("id")
);

-- Create views to speed common searches and decrease they complexity
CREATE VIEW "hedgehogs_workers_in_shelters_view" AS
SELECT "shelters"."id" AS "shelter id", "shelters"."name" AS "shelter name",
"hedgehogs"."id" AS "hedgehog id",
"hedgehogs"."name" AS "hedgehog name", "workers"."id" AS "worker id", "workers"."first_name" AS "worker first name",
"workers"."last_name" AS "worker last name" FROM "hedgehogs"
JOIN "hedgehogs_workers" ON "hedgehogs_workers"."hedgehog_id" = "hedgehogs"."id"
JOIN "shelter_workers" ON "shelter_workers"."worker_id" = "hedgehogs_workers"."worker_id"
JOIN "shelters" ON "shelters"."id" = "shelter_workers"."shelter_id"
JOIN "workers" ON "workers"."id" = "shelter_workers"."worker_id";


CREATE VIEW "food_in_shelters_view" AS
SELECT "shelters"."id" AS "shelter id", "shelters"."name" AS "shelter name",
"food"."id" AS "food id", "food"."name" AS "food name",
"shelters_food"."id" AS "expire id", "amount", "expires" FROM "shelters_food"
JOIN "food" ON "food"."id" = "shelters_food"."food_id"
JOIN "shelters" ON "shelters"."id" = "shelters_food"."shelter_id";


CREATE VIEW "hedgehogs_medicine_in_shelters_view" AS
SELECT "hedgehogs"."id" AS "hedgehog id", "hedgehogs"."name" AS "hedgehog name",
"shelters"."id" AS "shelter id", "shelters"."name" AS "shelter name",
"medicine"."id" AS "medicine id", "medicine"."name" AS "medicine name",
"shelters_medicine"."id" AS "expire id", "amount", "expires" FROM "shelters_medicine"
JOIN "medicine" ON "medicine"."id" = "shelters_medicine"."medicine_id"
JOIN "shelters" ON "shelters"."id" = "shelters_medicine"."shelter_id"
JOIN "hedgehogs_medicine" ON "medicine"."id" = "hedgehogs_medicine"."medicine_id"
JOIN "hedgehogs" ON "hedgehogs"."id" = "hedgehogs_medicine"."hedgehog_id";

-- Create indexes to speed common searches
CREATE INDEX "hedgehogs_names" ON "hedgehogs" ("name");
CREATE INDEX "shelters_names" ON "shelters" ("name");
CREATE INDEX "workers_names" ON "workers" ("first_name", "last_name");
CREATE INDEX "hedgehogs_of_workers" ON "hedgehogs_workers" ("worker_id");
CREATE INDEX "workers_in_shelters" ON "shelter_workers" ("worker_id");
CREATE INDEX "hedgehogs_shelters" ON "hedgehogs_in_shelters" ("shelter_id");
CREATE INDEX "food_expires" ON "shelters_food" ("expires");
CREATE INDEX "medicine_expires" ON "shelters_medicine" ("expires");
CREATE INDEX "medicine_for_hedgehogs" ON "hedgehogs_medicine" ("hedgehog_id");
