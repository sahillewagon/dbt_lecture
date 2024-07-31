WITH extract_sub AS
( 
    SELECT 
    EXTRACT(MONTH from date_date) AS MONTH
    , EXTRACT(YEAR from date_date) AS YEAR
    , ads_margin
    , average_basket
    , operational_margin
    FROM {{ref("finance_campaigns_day")}}
)
SELECT 
CONCAT(YEAR, MONTH) AS datemonth
, SUM(ads_margin) AS m_ads_margin
, SUM(average_basket) AS m_avg_basket
, SUM(operational_margin) AS m_ops_margin
FROM extract_sub
GROUP BY datemonth
