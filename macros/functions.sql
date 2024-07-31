{% macro margin_percent(revenue, purchase_price_float, precision = 2) %}
(
    ROUND(1-safe_divide(purchase_price_float/revenue),precision)
)
{% endmacro %}
