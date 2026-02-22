select *
from premium_risk_500;

-- Used SQl to Identify which individuals pay the most Annually in Premiums based on Accident History. 
select Accident_History, avg(Annual_Premium) as Average_Premium_Annually
from premium_risk_500
group by(Accident_History)
order by 2 desc ;

-- Found out how much each customer claimed through insurance during the previous year
select Customer_ID,Car_Value, Location_Risk_Level , Car_Value * Claims_last_Year as Total_claims
from premium_risk_500;

-- Used SQL to investigate the rolling total of claims paid out to customers to find out how much was spent on claims

with Rolling_Total as 
(
select Customer_ID, Annual_Premium, Annual_Premium * Claims_last_Year as Total_claims
from premium_risk_500
)
select Customer_ID,Annual_Premium, Total_claims, sum(Total_claims) over(order by Customer_ID) rolling_total_of_claims
from Rolling_Total;


