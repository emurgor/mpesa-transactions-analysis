--02_total_spend_per_category
--2.For each category, show every transaction alongside the total amount spent in that category across the entire dataset.
--Findings: Bank transfer paybill category  takes up a significant amount of the total spend 
SELECT
details,
category,
SUM(withdrawn) over(partition by category) as TotalSpend
from mpesa_analysis.dbo.Transactions