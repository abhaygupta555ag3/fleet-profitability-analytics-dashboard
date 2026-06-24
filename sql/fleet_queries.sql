-- ============================================
-- CAB AGGRESSION — Fleet Analytics SQL Queries
-- Author: Abhay Gupta
-- Period: March 2018 – August 2021
-- ============================================

-- 1. TOTAL REVENUE BY PHASE
SELECT 
    Phase,
    COUNT(*) AS total_months,
    SUM(Gross_Revenue) AS total_revenue,
    AVG(Gross_Revenue) AS avg_monthly_revenue,
    MAX(Gross_Revenue) AS peak_revenue
FROM monthly_pnl
GROUP BY Phase
ORDER BY total_revenue DESC;

-- 2. MONTHLY PROFIT TREND
SELECT 
    Month,
    Fleet_Size,
    Gross_Revenue,
    Total_OpEx,
    Net_Profit,
    ROUND((Net_Profit * 100.0 / Gross_Revenue), 2) AS profit_margin_pct
FROM monthly_pnl
WHERE Gross_Revenue > 0
ORDER BY Month;

-- 3. VEHICLE ROI RANKING
SELECT 
    Car_ID,
    Model,
    Purchase_Price,
    Avg_Revenue_Per_Month,
    EMI_Per_Month,
    Net_Contribution_Per_Month,
    ROUND((Net_Contribution_Per_Month * 100.0 / Purchase_Price), 2) AS monthly_roi_pct
FROM vehicle_master
ORDER BY monthly_roi_pct DESC;

-- 4. WIND-DOWN RECOVERY ANALYSIS
SELECT 
    Car_ID,
    Model,
    Purchase_Price,
    Sale_Price,
    Recovery_Pct,
    Disposal_Reason
FROM windown_analysis
ORDER BY Recovery_Pct DESC;

-- 5. CHANNEL STRATEGY — COMMISSION VS INSURANCE SAVINGS
SELECT 
    Month,
    Fleet_Size,
    Zoomcar_Pct,
    Direct_Pct,
    Commission_Paid,
    Insurance_Value_Saved,
    Net_Benefit_of_Zoomcar,
    CASE 
        WHEN Net_Benefit_of_Zoomcar > 0 THEN 'Zoomcar Profitable'
        ELSE 'Direct Better'
    END AS channel_verdict
FROM channel_strategy
ORDER BY Month;

-- 6. TOP 5 HIGHEST REVENUE MONTHS
SELECT TOP 5
    Month,
    Phase,
    Fleet_Size,
    Gross_Revenue,
    Net_Profit
FROM monthly_pnl
ORDER BY Gross_Revenue DESC;