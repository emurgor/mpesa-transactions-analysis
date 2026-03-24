--3.What are my top 3 spending categories per month?
--CTE and Ranking using ROWNUMBER()
--Findings:Savings and investments feature highly as the highest spending categories every month.
with monthlyspend as (
Select
category,
EOMONTH(completion_time) as TxnMonth,
SUM(withdrawn) as TotalSpend
from mpesa_analysis.dbo.Transactions 
where category!='Fuliza/OD'
GROUP BY
category,
EOMONTH(completion_time)
),
RankedSpend as (
SELECT
category,
TxnMonth,
TotalSpend,
ROW_NUMBER()OVER( PARTITION BY TxnMonth ORDER BY TotalSpend DESC) as Ranking
from monthlyspend
where TotalSpend<>0
)
Select * from RankedSpend
where Ranking between 1 and 3