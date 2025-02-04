SELECT 
    SUM(o.product_quantity * p.sale_price) AS total_revenue,
    s.store_type,
    s.country_code

FROM orders o

INNER JOIN dim_products p ON p.product_code = o.product_code
INNER JOIN dim_stores s ON s.store_code = o.store_code
INNER JOIN dim_date d ON d.date = o.order_date

WHERE s.country_code = 'DE' AND TO_DATE(d.date, 'DD/MM/YYYY') BETWEEN TO_DATE('01/01/2022', 'DD/MM/YYYY') AND TO_DATE('31/12/2022', 'DD/MM/YYYY')
GROUP BY s.store_type, s.country_code
ORDER BY total_revenue DESC

