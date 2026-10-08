
use [BL DB];

select * from bank_loan

select count(id)  as Total_application from bank_loan;

select member_id , next_payment_date from bank_loan where next_payment_date between '2021-03-11' and '2021-11-11'; 


select count(id) as MT_TO_DATE_Total_application , month(next_payment_date) as months from bank_loan group by month(next_payment_date) order by month(next_payment_date);





select count(id) as MTD_Total_application from bank_loan WHERE month(issue_date) = 12;




select count(id) as PTMD_Total_application from bank_loan WHERE month(issue_date) = 11;
---{MTD-PMTD}/PMTD



---Total_Funded_amount
select SUM(loan_amount)  as Total_Funded_amount from bank_loan;


---MTD_Total_Funded_amount
select SUM(loan_amount) as MTD_Total_Funded_amount from bank_loan WHERE month(issue_date) = 12 AND YEAR(issue_date) = 2021;

---PTMD_Total_Funded_amount
select SUM(loan_amount) as PMTD_Total_Funded_amount from bank_loan WHERE month(issue_date) = 11 AND YEAR(issue_date) = 2021;


--Total amount received
select SUM(total_payment) as total_Amount_received from bank_loan

--MTD Total amount received
select SUM(total_payment) as MTD_total_bank_loan_data from bank_loan
where month(issue_date) = 12 AND YEAR(issue_date) = 2021



--PTMD Total amount received
select SUM(total_payment) as PTMD_total_bank_loan_data from bank_loan
where month(issue_date) = 11 AND YEAR(issue_date) = 2021


--Avg Interest Rate
SELECT ROUND(100*AVG(int_rate),2) as AVG_Interest_rate FROM bank_loan

--MTD Avg Interest Rate
SELECT ROUND(100*AVG(int_rate),2) as MTD_AVG_Interest_rate FROM bank_loan
where month(issue_date) = 12 AND YEAR(issue_date) = 2021


--PMTD Avg Interest Rate
SELECT ROUND(100*AVG(int_rate),2) as PMTD_AVG_Interest_rate FROM bank_loan
where month(issue_date) = 11 AND YEAR(issue_date) = 2021



--Avg DTI
SELECT ROUND(100*AVG(dti) , 2)as AVG_DTI FROM bank_loan

--MTD Avg DTI
SELECT ROUND(100*AVG(dti) , 2)as MTD_AVG_DTI FROM bank_loan
where month(issue_date) = 12 AND YEAR(issue_date) = 2021


--PTMD Avg DTI
SELECT ROUND(100*AVG(dti) , 2)as PTMD_AVG_DTI FROM bank_loan
where month(issue_date) = 11 AND YEAR(issue_date) = 2021



--Good Loan Bad Loan
SELECT 
    COUNT(id) AS total_num,
    CASE 
        WHEN loan_status IN ('Fully Paid' , 'Current') THEN 'GOOD'
        ELSE 'BAD'
    END AS loan_category
FROM bank_loan
GROUP BY 
    CASE 
        WHEN loan_status IN ('Fully Paid' , 'Current')  THEN 'GOOD'
        ELSE 'BAD'
    END;



--Good Loan Percentage
SELECT 
  (count(CASE WHEN loan_status IN ('Fully Paid' , 'Current')  THEN id END)*100) / count(id) as 
  good_loan_per

from bank_loan



select count(id)  as Good_loan_application  from bank_loan where loan_status in ('Fully Paid' , 'Current'); 





--Good Loan Funded Amount
select SUM(loan_amount)  as Total_Funded_amount from bank_loan where loan_status in ('Fully Paid' , 'Current'); 



--Good Loan received Amount
select SUM(total_payment)  as Good_loan_received_amount from bank_loan where loan_status in ('Fully Paid' , 'Current'); 


--Bad Loan Percentage
SELECT 
  ROUND((count(CASE WHEN loan_status ='Charged Off' THEN id END)*100)/ count(id),2) as 
  Bad_loan_per from bank_loan



--Bad Loan Funded Amount
select SUM(loan_amount)  as Bad_loan_Funded_amount from bank_loan where loan_status = 'Charged Off'; 


--Bad Loan received Amount
select SUM(total_payment)  as Good_loan_received_amount from bank_loan where  loan_status = 'Charged Off';



SELECT 
   loan_status,
   count(id) as Total_loan_applications,
   SUM(total_payment) as Total_Amount_Received,
   SUM(loan_amount) AS Total_Funded_Amount,
   AVG(int_rate * 100) as Interest_Rate,
   AVG(dti * 100) as DTI
   from bank_loan
   Group by loan_status






   SELECT 
   loan_status,
   SUM(total_payment) as MTD_Total_Amount_Received,
   SUM(loan_amount) AS MTD_Total_Funded_Amount
   from bank_loan
   WHERE month(issue_date) = 12
   Group by loan_status




--DASHBOARD - 2

select * from bank_loan

select 
MONTH(issue_date) AS Month_Num,
DATENAME(MONTH , issue_date) as Month_Name ,COUNT(id) as Total_Loan_Application , SUM(loan_amount) as 
Total_Funded_amount , SUM(total_payment) as Total_Received_Amount
from bank_loan
GROUP BY  MONTH(issue_date), DATENAME(MONTH ,issue_date) 
ORDER BY month(issue_date) asc;


--Reginal Metrics
select 
address_state ,
COUNT(id) as Total_Loan_Application ,
SUM(loan_amount) as Total_Funded_amount , 
SUM(total_payment) as Total_Received_Amount
from bank_loan
GROUP BY address_state
ORDER BY address_state


--Loan term donut chart
select 
term ,
COUNT(id) as Total_Loan_Application ,
SUM(loan_amount) as Total_Funded_amount , 
SUM(total_payment) as Total_Received_Amount
from bank_loan
GROUP BY term
ORDER BY term




--Loan term donut chart
select 
emp_length ,
COUNT(id) as Total_Loan_Application ,
SUM(loan_amount) as Total_Funded_amount , 
SUM(total_payment) as Total_Received_Amount
from bank_loan
GROUP BY emp_length
ORDER BY emp_length




--Loan term donut chart
select 
purpose ,
COUNT(id) as Total_Loan_Application ,
SUM(loan_amount) as Total_Funded_amount , 
SUM(total_payment) as Total_Received_Amount
from bank_loan
GROUP BY purpose
ORDER BY purpose


--Loan term donut chart
select 
home_ownership ,
COUNT(id) as Total_Loan_Application ,
SUM(loan_amount) as Total_Funded_amount , 
SUM(total_payment) as Total_Received_Amount
from bank_loan
GROUP BY home_ownership
ORDER BY home_ownership



















