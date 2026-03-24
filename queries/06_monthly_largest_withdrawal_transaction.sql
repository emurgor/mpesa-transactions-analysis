--For each month, show my single largest withdrawal transaction
--Findings:The most prominent largest withdrawal across the months is rent payment
with rankedtransactions as (
SELECT 
details as TTxnDescription,
category,
completion_time as TxnDate,
month as TxnMonth,
withdrawn,
DENSE_RANK() OVER (PARTITION BY month order by withdrawn desc) as ranking
from mpesa_analysis.dbo.Transactions
where category!='Fuliza/OD' and withdrawn<>0
)
SELECT
* from rankedtransactions
where ranking=1
