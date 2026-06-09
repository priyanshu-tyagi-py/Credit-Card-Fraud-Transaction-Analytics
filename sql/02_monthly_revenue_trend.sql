--Monthly Revenue Trend--
SELECT 
    DATE_TRUNC('month', trans_date_trans_time) AS month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt),2) AS total_revenue,

    ROUND(
        (
            SUM(amt) - LAG(SUM(amt)) OVER(
                ORDER BY DATE_TRUNC('month', trans_date_trans_time)
            )
        )
        /
        LAG(SUM(amt)) OVER(
            ORDER BY DATE_TRUNC('month', trans_date_trans_time)
        ) * 100,
        2
    ) AS monthly_growth_pct

FROM bank_transactions
GROUP BY month
ORDER BY month;
