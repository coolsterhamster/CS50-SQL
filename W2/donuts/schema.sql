CREATE TABLE IF NOT EXISTS "ingredients"(
    -- flour, yeast, oil, butter, and several different types of sugar
    -- price we pay per unit of ingredient
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    "unit" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "donuts"(
    -- name, gluten-free, price
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK("gluten_free" in (0, 1)),
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "donut_ing"(
    -- donut and its ingredients
    "donut_id" INTEGER NOT NULL,
    "ingredients_id" INTEGER NOT NULL,
    PRIMARY KEY("donut_id", "ingredients_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);

CREATE TABLE IF NOT EXISTS "customers"(
    -- customer’s first and last name, history of their orders
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "orders"(
    -- order number, donuts in the order, customer who placed the order
    "id" INTEGER,
    "order_number" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "order_donuts"(
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
)



