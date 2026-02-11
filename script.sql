CREATE TABLE customers
(customer_id VARCHAR(50) PRIMARY KEY,
first_name Varchar(50),
last_name Varchar(50),
email Varchar(50),
state Varchar(50),
signup_date TIMESTAMP
)

SELECT *FROM CUSTOMERS

SELECT first_name, replace(first_name,'''','') as first_name_cleaned
from customers

select first_name, coalesce (first_name, 'unknown')
as first_name_cleaned
from customers

SELECT first_name, replace(first_name,'''','') as first_name_cleaned
from customers

update customers
set first_name = coalesce(replace(first_name, '''',''), 'unknown'),
last_name = coalesce(replace(last_name,'''',''), 'unknown')

update customers
set email= coalesce(email,'unknown')

select date(signup_date) from customers

update customers
set signup_date = signup_date :: date

select 
concat(first_name, ' ', last_name) from customers

alter table customers
add column full_name varchar(50)

select * from customers

update customers
set full_name = concat(first_name, ' ', last_name)

update customers
set full_name = trim(full_name)

Select state,
case
when STATE = 'FL' THEN 'Florida'
when STATE = 'ny' then 'New York'
when STATE = 'tx' then 'Texas'
else state
end as sate_name
from customers

update customers
set state = initcap(trim(state))

 update customers
 set state = case state
 when 'Ny' THEN 'New York'
 when 'Fl' then 'Florida'
 when 'Tx' then 'Texas'
 when 'Ca' THEN 'California'
 else state
 end

 select * from customers

 