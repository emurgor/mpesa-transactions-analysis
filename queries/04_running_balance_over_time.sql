--4.Show each transaction with a running balance of my total withdrawals over time
--Findings: The account is mostly always in an Overdraft(Fuliza) which resets after every transaction
SELECT
details,
category,
completion_time as TxnDate,
withdrawn,
SUM(withdrawn)over(ORDER by completion_time) as running_total
from mpesa_analysis.dbo.Transactions

