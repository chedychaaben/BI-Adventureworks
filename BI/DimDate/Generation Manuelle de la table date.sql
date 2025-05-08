-- Create the DimDate table
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    DateValue DATE,
    Year INT,
    Month INT,
    Day INT,
    MonthName VARCHAR(20),
    DayOfWeek INT,
    DayName VARCHAR(20),
    Quarter INT
);

-- Declare variables
DECLARE @Date DATE = '2011-01-01';
DECLARE @EndDate DATE = '2015-12-31';

-- Insert data
WHILE @Date <= @EndDate
BEGIN
    INSERT INTO DimDate (
        DateKey,
        DateValue,
        Year,
        Month,
        Day,
        MonthName,
        DayOfWeek,
        DayName,
        Quarter
    )
    VALUES (
        CONVERT(INT, CONVERT(VARCHAR(8), @Date, 112)), -- e.g., 20080101
        @Date,
        YEAR(@Date),
        MONTH(@Date),
        DAY(@Date),
        DATENAME(MONTH, @Date),
        DATEPART(WEEKDAY, @Date),
        DATENAME(WEEKDAY, @Date),
        DATEPART(QUARTER, @Date)
    );
    SET @Date = DATEADD(DAY, 1, @Date);
END;