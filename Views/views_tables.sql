CREATE TABLE DataUnits (
    id INT PRIMARY KEY,
    data_bits VARCHAR(8),   -- 8-bit data string
    parity_bit CHAR(1)      -- stored parity bit
);

INSERT INTO DataUnits (id, data_bits, parity_bit)
VALUES
(1, '10110010', '0'),
(2, '11100011', '0'),
(3, '00000000', '0');