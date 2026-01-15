WITH approved_transactions AS (
    SELECT
        country,
        COUNT(state) AS approved_count,
        SUM(amount) AS approved_total_amount,
        -- MySQL fix: Truncate date to the first day of the month
        DATE_FORMAT(trans_date, '%Y-%m') AS trans_month 
    FROM 
        transactions
    WHERE 
        state = 'approved'
    GROUP BY 
        country,
        trans_month -- Group by the new month column
)

SELECT
    DATE_FORMAT(t.trans_date, '%Y-%m') AS month, -- Truncate date for grouping
    t.country,
    COUNT(t.state) AS trans_count,
        COALESCE(MIN(a.approved_count), 0) AS approved_count,
    SUM(t.amount) AS trans_total_amount,

    -- Use COALESCE to display 0 instead of NULL if no approved transactions exist

    COALESCE(MIN(a.approved_total_amount), 0) AS approved_total_amount
FROM 
    transactions t
LEFT JOIN 
    approved_transactions a
    ON t.country <=> a.country
    AND DATE_FORMAT(t.trans_date, '%Y-%m') = a.trans_month -- Join on the truncated month
GROUP BY
    t.country,
    month; -- Group by the aliased month column