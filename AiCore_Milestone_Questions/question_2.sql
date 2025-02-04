SELECT 
    SUM(o.product_quantity * p.sale_price) AS total_revenue,
    d.month_number,
    d.month_name
FROM orders o
INNER JOIN dim_products p ON o."product_code" = p."product_code"
INNER JOIN dim_date d ON o.order_date = d.date
WHERE TO_DATE(d.date, 'DD/MM/YYYY') BETWEEN TO_DATE('01/01/2022', 'DD/MM/YYYY') AND TO_DATE('31/12/2022', 'DD/MM/YYYY')
GROUP BY d.month_number, d.month_name
ORDER BY total_revenue DESC


