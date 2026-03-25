---7.8.	Show each transaction alongside the average withdrawal amount for that category —
-- and flag transactions that are more than double that average as "Unusually High".
--Most prominent categories with unusually high transactions are airtime and data, bank transfer paybill, and maerchant payments
with Txns as (SELECT
details as TxnDescription,
category,
completion_time as TxnDate,
withdrawn as TxnAmount,
AVG(withdrawn)over(partition by category) as AvgperCategory
from  mpesa_analysis.dbo.Transactions
where Category!='Fuliza/OD' and withdrawn>0
)
Select 
t.*,
CASE WHEN TxnAmount>(AvgperCategory*2) then 'Unusually High' else 'Normal' end as 'Flag'
from Txns t