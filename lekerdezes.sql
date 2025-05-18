-- 1. feladat: Az eladások havi bontásban és azok bevétele
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, COUNT(*) AS sales_count, SUM(sale_price) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month DESC;

-- 2. feladat: Minden értékesítő legdrágább eladása
SELECT sp.name AS salesperson_name, c.brand, c.model, s.sale_price, s.sale_date
FROM sales s
JOIN cars c ON s.car_id = c.car_id
JOIN salespersons sp ON s.salesperson_id = sp.salesperson_id
WHERE s.sale_price = (
    SELECT MAX(s2.sale_price)
    FROM sales s2
    WHERE s2.salesperson_id = s.salesperson_id
)
ORDER BY s.sale_price DESC;

-- 3. feladat: Az értékesítők teljesítményének kategorizálása (alacsony/közepes/magas eladásszám alapján)
SELECT sp.name AS 'Név', COUNT(sp.salesperson_id) AS 'Összes Eladás',
    CASE 
        WHEN COUNT(s.salesperson_id) >= 10 THEN 'Kiváló'
        WHEN COUNT(s.salesperson_id) >= 5 THEN 'Közepes'
        ELSE 'Alacsony'
    END AS 'Teljesítmény'
FROM salespersons sp
LEFT JOIN sales s ON sp.salesperson_id = s.salesperson_id
GROUP BY sp.name
ORDER BY COUNT(sp.salesperson_id) DESC;

-- 4. feladat: Melyik márkából mennyi autót adtak el, és mennyi az átlagos eladási ár?
SELECT c.brand, COUNT(s.sale_id) AS eladott_kocsik, ROUND(AVG(s.sale_price), 2) AS atlag_ar
FROM sales s
JOIN cars c ON s.car_id = c.car_id
GROUP BY c.brand
HAVING COUNT(s.sale_id) >= 1
ORDER BY eladott_kocsik DESC;

-- 5. feladat: Az ügyfelek, akik legalább 2 autót vásároltak (beágyazott lekérdezéssel)
SELECT name, number_of_purchases
FROM (
    SELECT cu.name, COUNT(s.sale_id) AS number_of_purchases
    FROM customers cu
    JOIN sales s ON cu.customer_id = s.customer_id
    GROUP BY cu.name
) AS sub
WHERE number_of_purchases >= 2
ORDER BY number_of_purchases DESC;

-- 6. feladat: Melyik autó volt a legdrágábban eladott minden évben (ranking használattal)
WITH ranked_sales AS (
    SELECT c.brand, c.model, c.year, s.sale_price, s.sale_date,
           RANK() OVER (PARTITION BY EXTRACT(YEAR FROM s.sale_date) ORDER BY s.sale_price DESC) AS rnk
    FROM sales s
    JOIN cars c ON s.car_id = c.car_id
)
SELECT * 
FROM ranked_sales
WHERE rnk = 1
ORDER BY year DESC;