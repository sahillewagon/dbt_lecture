WITH join_sub AS
(
    SELECT *
    FROM {{ref("finance_days")}} 
    LEFT JOIN {{ref("int_campaigns_day")}}
    USING (date_date)
)
SELECT 
date_date
, join_sub.operational_margin - join_sub.ads_cost AS ads_margin
, join_sub.average_basket
, join_sub.operational_margin
FROM join_sub