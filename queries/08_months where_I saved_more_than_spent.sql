--8.Which months did I save more than I spent — meaning paid in exceeded withdrawn?
--There is no month where I saved more than I spent
SELECT
EOMONTH(completion_time) as TxnMonth,
SUM(paid_in) as 'PaidIn',
SUM(withdrawn) as Withdrawals
from mpesa_analysis.dbo.Transactions
where category!='Fuliza/OD' and withdrawn>0
GROUP BY
EOMONTH(completion_time) 
HAVING SUM(paid_in)>SUM(withdrawn)



