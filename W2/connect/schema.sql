CREATE TABLE IF NOT EXISTS "users"(
    -- first and last name, username, password
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "schools"(
    -- school name, type of school, location, founded year
    "id" INTEGER,
    "school_name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "school_location" TEXT NOT NULL,
    "founded" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "companies"(
    -- company name, industry, location
    "id" INTEGER,
    "company_name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "company_location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

 -- connections with people, connections with schools, connections with companies

CREATE TABLE IF NOT EXISTS "user_connections"(
    "user1_id" INTEGER NOT NULL,
    "user2_id" INTEGER NOT NULL,
    PRIMARY KEY("user1_id", "user2_id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

CREATE TABLE IF NOT EXISTS "school_connections"(
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start" NUMERIC NOT NULL,
    "end" NUMERIC NOT NULL,
    "degree" TEXT NOT NULL,
    PRIMARY KEY("user_id", "school_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE IF NOT EXISTS "company_connections"(
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start" NUMERIC NOT NULL,
    "end" NUMERIC NOT NULL,
    "title" TEXT NOT NULL,
    PRIMARY KEY("user_id", "company_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
