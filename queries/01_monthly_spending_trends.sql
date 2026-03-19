--Business Question
-- 1.	What is my total spending per month and how does it compare to the previous month 
--— both in absolute and percentage terms?
--select top 5 * from mpesa_analysis.dbo.Transactions
with monthlyspending as (
SELECT
EOMONTH(completion_time) as [month],
SUM(withdrawn) as [totalspend]
from mpesa_analysis.dbo.Transactions t
where category!='Fuliza/OD'
group by 
EOMONTH(completion_time)
)
SELECT
    [month],
    totalspend,
  LAG(totalspend,1,null) over (order BY [month]) as prevmonthspend,
  totalspend - LAG(totalspend,1,null) over (order BY [month]) as MonthlyDifference,
  (totalspend - LAG(totalspend,1,null) over (order BY [month]))/
  LAG(totalspend,1,null) over (order BY [month])*100 as PercentageDifference
FROM monthlyspending
