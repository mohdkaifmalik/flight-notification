-- Create Flights Table
CREATE TABLE Flights (
    flight_name TEXT PRIMARY KEY,
    departure_date TEXT,
    departure_time TEXT,
    departure_terminal TEXT,
    departure_gate TEXT,
    arrival_date TEXT,
    arrival_time TEXT,
    arrival_terminal TEXT,
    arrival_gate TEXT
);

-- Create FlightStatus Table
CREATE TABLE FlightStatus (
    flight_name TEXT PRIMARY KEY,
    status TEXT,
    delay_time TEXT,
    gate TEXT,
    FOREIGN KEY (flight_name) REFERENCES Flights(flight_name)
);

-- Create Notifications Table
CREATE TABLE Notifications (
    flight_name TEXT,
    message TEXT,
    FOREIGN KEY (flight_name) REFERENCES Flights(flight_name)
);

-- Insert sample data for Flights
INSERT INTO Flights (flight_name, departure_date, departure_time, departure_terminal, departure_gate, arrival_date, arrival_time, arrival_terminal, arrival_gate)
VALUES
    ('IndiGo 1013', '2024-07-29', '09:11 AM', '2', 'A6', '2024-07-29', '05:45 PM', '1', 'A5'),
    ('Vistara 115', '2024-07-31', '11:00 AM', '2', 'C3', '2024-07-31', '08:30 PM', '1', 'B2'),
    ('Air India 380', '2024-08-02', '07:45 PM', '2', 'B1', '2024-08-03', '04:15 AM', '1', 'C2');

-- Insert sample data for FlightStatus
INSERT INTO FlightStatus (flight_name, status, delay_time,gate)
VALUES
    ('IndiGo 1013', 'On time', NULL,'No gate change'),
    ('Vistara 115', 'Delayed', '15 mins','now C5'),
    ('Air India 380', 'Cancelled', NULL,NULL);

--To test if notifications works after status update
UPDATE FlightStatus
SET status = 'Delayed', delay_time = '19 mins' -- Adjust delay_time as needed
WHERE flight_name = 'IndiGo 1012'; -- Specify the flight_name you want to update


-- Insert sample data for Notifications
INSERT INTO Notifications (flight_name, message)
VALUES
    ('IndiGo 1013', 'En route and arriving as scheduled.'),
    ('Vistara 115', 'Departure Delayed by 15 mins. Gate Change: Now C5.'),
    ('Air India 380', 'Flight Cancelled due to some technical difficulties. Contact airline for rebooking.');

--notification
-- Create a trigger to update notifications on flight status change
CREATE TRIGGER UpdateNotificationAfterStatusChange
AFTER UPDATE OF status ON FlightStatus
FOR EACH ROW
BEGIN
    DELETE FROM Notifications WHERE flight_name = NEW.flight_name;
    INSERT INTO Notifications (flight_name, message) VALUES (
        NEW.flight_name,
        CASE
            WHEN NEW.status = 'On time' THEN 'En route and arriving as scheduled.'
            WHEN NEW.status = 'Delayed' THEN 'Departure Delayed by ' || NEW.delay_time || '.'
            WHEN NEW.status = 'Cancelled' THEN 'Flight Cancelled due to some technical difficulties. Contact airline for rebooking.'
            ELSE 'Status updated.'
        END
    );
END;
