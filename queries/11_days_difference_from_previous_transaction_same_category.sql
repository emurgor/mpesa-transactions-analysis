--11.For each transaction, show how many days have passed since my previous transaction 
--in the same category.
--select top 5 * from [mpesa_analysis].[dbo].[Transactions]
SELECT
category,
details,
CAST(completion_time as Date) as TxnDate,
LAG(CAST(completion_time as Date)) OVER (PARTITION BY category ORDER BY CAST(completion_time as Date) ) as PreviousDay,
DATEDIFF(day,LAG(CAST(completion_time as Date)) OVER (PARTITION BY category ORDER BY CAST(completion_time as Date) ),CAST(completion_time as Date)) as DaysDiff
from  [mpesa_analysis].[dbo].[Transactions]