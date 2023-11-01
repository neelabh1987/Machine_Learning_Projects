SELECT * FROM employees.cleaned_credit_card_data;
-- MySQL questions
-- 1 Group the customers based on their income type and find the average of their annual income.
select Type_income, round(avg(Annual_income), 2) as Average_annual_income from cleaned_credit_card_data group by Type_Income;

-- 2 Find the female owners of cars and property
select * from cleaned_credit_card_data where GENDER = 'F' and Car_Owner = 'Y' and Propert_Owner = 'Y'; 

-- 3 Find the male customers who are staying with their families.
select * from cleaned_credit_card_data where GENDER = 'M' and Housing_type = 'With parents';

-- 4 Please list the top five people having the highest income.
select * from cleaned_credit_card_data order by Annual_income desc limit 5;

-- 5 How many married people are having bad credit ?
select count(*) as Married_bad_credit from cleaned_credit_card_data where Marital_status = 'Married' and label = 1;

-- 6 What is the highest education level and what is the total count ?
select EDUCATION, count(*) as Education_category_count from cleaned_credit_card_data group by EDUCATION; 

SET sql_mode = '';
-- 7 Between married males and females, who is having more bad credit? 
select GENDER, count(label) as Total_bad_credit, label, Marital_status from cleaned_credit_card_data group by GENDER, label having Marital_status = 'Married' and label = 1;
-- It seems that Married females has more bad credit than their male counterpart.