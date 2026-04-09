CREATE VIEW v_CalculatedParity AS
SELECT 
    id,
    data_bits,
    parity_bit,
    -- Count number of 1s in the string
    (SELECT COUNT(*) 
     FROM STRING_SPLIT(data_bits, '') 
     WHERE value = '1') AS ones_count,
    CASE 
        WHEN (SELECT COUNT(*) 
              FROM STRING_SPLIT(data_bits, '') 
              WHERE value = '1') % 2 = 0 
        THEN '0' ELSE '1' 
    END AS recalculated_parity
FROM DataUnits;