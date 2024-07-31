SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64) AS purchase_price_float,
    ROUND(sales.quantity*CAST(product.purchase_price AS FLOAT64),2) AS purchase_cost,
    sales.revenue - ROUND(sales.quantity*CAST(product.purchase_price AS FLOAT64),2) AS margin
FROM {{ref("stg_raw__sales")}} sales
    LEFT JOIN {{ref("stg_raw__product")}} product
    ON sales.pdt_id = product.products_id
