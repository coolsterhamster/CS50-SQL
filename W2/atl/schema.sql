CREATE TABLE "Passengers"(
    -- first name, last name, and age
    "id" INTEGER,
    "first name" TEXT NOT NULL,
    "last name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "CheckIns"(
    -- date, time, and flight
    "id" INTEGER,
    "passenger_id" NOT NULL,
    "flight_id" NOT NULL,
    "date" NUMERIC NOT NULL,
    "time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES Passengers("id"),
    FOREIGN KEY("flight_id") REFERENCES Flights("id")
);

CREATE TABLE "Airlines"(
    -- airline, and concourses
    "id" INTEGER,
    "airline" TEXT NOT NULL,
    "concourses" TEXT NOT NULL check("concourse" in ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "Flights"(
    -- flight number, airline, departure code, arrival code, departure date and time, and arrival date and time
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departure" TEXT NOT NULL,
    "arrival" TEXT,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES Airlines("id")
);
