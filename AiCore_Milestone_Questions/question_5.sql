SELECT
    SUM((p.sale_price - p.cost_price) * o.product_quantity) AS profit,
    p.category,
    s.geography

FROM orders o

INNER JOIN dim_products p ON p.product_code = o.product_code
INNER JOIN dim_stores s ON s.store_code = o.store_code
INNER JOIN dim_date d ON d.date = o.order_date
WHERE s.geography = 'Wiltshire, United Kingdom' 
    AND TO_DATE(d.date, 'DD/MM/YYYY') BETWEEN TO_DATE('01/01/2021', 'DD/MM/YYYY') AND TO_DATE('31/12/2021', 'DD/MM/YYYY')
GROUP BY p.category, s.geography
ORDER BY profit DESC;