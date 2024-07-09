WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),
immediate_first_orders AS (
    SELECT 
        d.customer_id,
        CASE 
            WHEN d.order_date = d.customer_pref_delivery_date THEN 1  -- Immediate order
            ELSE 0  -- Scheduled order
        END AS is_immediate
    FROM 
        Delivery d
    INNER JOIN 
        first_orders fo ON d.customer_id = fo.customer_id AND d.order_date = fo.first_order_date
)
SELECT 
    ROUND(SUM(is_immediate) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM 
    immediate_first_orders;

-- Got this solution from https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50
-- Was stuck and realized I misread the question.