-- Table to store 8-bit data units
CREATE TABLE DataUnits (
    id INT PRIMARY KEY,
    data_bits VARCHAR(8),   -- store as string of 0s and 1s
    parity_bit CHAR(1)      -- appended parity bit
);

-- Insert sample data (without parity bit yet)
INSERT INTO DataUnits (id, data_bits)
VALUES 
(1, '10110010'),
(2, '11100011'),
(3, '00000000');

-- Function (conceptual) to calculate even parity
-- In SQL Server, you can use this as a scalar function
CREATE FUNCTION dbo.CalculateParity(@bits VARCHAR(8))
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @count INT = 0;
    DECLARE @i INT = 1;
    WHILE @i <= LEN(@bits)
    BEGIN
        IF SUBSTRING(@bits, @i, 1) = '1'
            SET @count = @count + 1;
        SET @i = @i + 1;
    END

    -- If count of 1s is even → parity = 0, else parity = 1
    RETURN (CASE WHEN @count % 2 = 0 THEN '0' ELSE '1' END);
END;

-- Update table with calculated parity bits
UPDATE DataUnits
SET parity_bit = dbo.CalculateParity(data_bits);

-- Check received data (simulate error detection)
-- Compare recalculated parity with stored parity
SELECT 
    id,
    data_bits,
    parity_bit,
    dbo.CalculateParity(data_bits) AS recalculated_parity,
    CASE 
        WHEN parity_bit = dbo.CalculateParity(data_bits) 
        THEN 'No Error'
        ELSE 'Error Detected'
    END AS status
FROM DataUnits;