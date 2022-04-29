-- #1
INSERT INTO rental_records VALUES(
	5, 
    'SBA1111A', 
    (SELECT customer_id FROM customers WHERE name = 'Angel'), 
    CURDATE(), 
    DATE_ADD(CURDATE(), INTERVAL 10 DAY), 
    NULL
);

-- #2
INSERT INTO rental_records VALUES(
	6, 
    'GA5555E', 
    (SELECT customer_id FROM customers WHERE name = 'Kumar'), 
    CURDATE() + 1, 
    DATE_ADD(CURDATE(), INTERVAL 3 MONTH),
    NULL
);

-- #3
SELECT rental_records.start_date, rental_records.end_date, rental_records.veh_reg_no, vehicles.brand, customers.name
FROM rental_records
JOIN vehicles ON rental_records.veh_reg_no = vehicles.veh_reg_no
JOIN customers ON customers.customer_id = rental_records.customer_id
ORDER BY vehicles.category, rental_records.start_date;

-- #4 
SELECT * 
FROM rental_records
WHERE CURDATE() > end_date;

-- #5 
SELECT rental_records.veh_reg_no, customers.name, rental_records.start_date, rental_records.end_date 
FROM rental_records
JOIN customers USING (customer_id)
WHERE '2012-01-10' BETWEEN rental_records.start_date AND rental_records.end_date;


-- #6
SELECT rental_records.veh_reg_no, customers.name, rental_records.start_date, rental_records.end_date
FROM rental_records
JOIN vehicles USING (veh_reg_no)
JOIN customers USING (customer_id)
WHERE CURDATE() BETWEEN rental_records.start_date AND rental_records.end_date;

-- #7
SELECT rental_records.veh_reg_no, customers.name, rental_records.start_date, rental_records.end_date 
FROM rental_records
JOIN customers USING (customer_id)
WHERE rental_records.start_date between '2012-01-03' and '2012-01-18'
OR  rental_records.end_date between '2012-01-03' and '2012-01-18'
OR rental_records.start_date < '2012-01-03' and rental_records.end_date > '2012-01-18';

-- #8
SELECT vehicles.veh_reg_no, vehicles.brand, vehicles.desc 
FROM vehicles
LEFT JOIN rental_records USING (veh_reg_no)
WHERE veh_reg_no NOT IN (
	SELECT veh_reg_no 
    FROM rental_records
	WHERE start_date < '2012-01-10' AND end_date > '2012-01-10'
);

