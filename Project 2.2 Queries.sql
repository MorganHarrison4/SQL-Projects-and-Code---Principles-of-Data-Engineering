--Project 2.2 By Morgan Harrison, Celso Santiago, Linda Valencia and Michelle Yin

--Question 2: In how many travels, trains departed with customers only using tickets in 2017?
Select *
From travels tr
Where year (date)=2017 and travel_id
	In (Select distinct travel_id
		From tickets
		Where year(boarding_date) =2017)
		and travel_id
		not in (Select distinct travel_id
				From passes_travels
				Where year (boarding_date) = 2017)
-- Answer: 0 travels


--Question 4: In how many travels, trains departed with customers only using passes in 2017?
Select *
From travels tr
Where year (date)=2017 and travel_id
Not in (Select distinct travel_id
		From tickets
		Where year(boarding_date) =2017)
		and travel_id
		In (Select distinct travel_id
			From passes_travels
			Where year (boarding_date) = 2017)
--Answer: 105 travels


--Question 6: In how many travels, trains departed with csutomers using both passes and tickets in 2017?
Select *
From travels tr
Where year(date)=2017 and travel_id 
In (Select travel_id
	From tickets
	Where year(boarding_date) = 2017)
	and travel_id 
	In (Select travel_id
		From passes_travels
		Where year(boarding_date) = 2017)
--Answer: 5735 travels


--Question 8: Estimate the monthly average ratio of customers using tickets/passesin 2017.
Select 2016 year, (convert(decimal (10,2),
	(Select count (*)
	From tickets
	Where year (boarding_date)=2017)) / 
	convert (decimal (10,2),
		(Select count (*)
		From passes_travels
		Where year (boarding_date) =2017)))
--Answer: The ratio is 0.97


--Question 12:	Assuming that 3 wagons are assigned to each train in every travel, and each wagon has a capacity of 60 customers, what percentage of travels justify the usage of 3 wagons in 2017?
select ROW_NUMBER() over (order by sum(total) desc) position, 
	year,
	travel_id,
	sum(tickets) tickets,
	sum(passes) passes,
	sum(total) total,
	case when sum(total)>120 then 'YES' else 'NO' end as 'justify'
from
(select year(date) year, 
		tr.travel_id,
		count(*) tickets,
		0 passes,
		count(*) total
from travels tr join tickets ti on tr.travel_id=ti.travel_id
where year(date)=2017
group by tr.travel_id, year(date)
Union
select year(date) year, 
		tr.travel_id,
		0 tickets,
		count(*) passes,
		count(*) total
from travels tr join passes_travels pt on tr.travel_id=pt.travel_id
where year(date)=2017
group by tr.travel_id, year(date)
) a 
Group by travel_id, year
Order by position asc
--Answer: (773/5840)*100 = 13.23%

--Question 17: What are the three employees that have sold the most passes in 2016?
Select TOP 3 employees.first_name, employees.last_name,  count(*) as passes_sold
From employees, passes
Where employees.employee_id = passes.employee_id and year(purchase_date)=2016
Group by employees.first_name, employees.last_name
Order by passes_sold desc
--Answer: Mikael Orman, Chlo Monnoyer, Nathalie Marner


--Question 18: What are the three employees that have sold the most passes in 2017?
Select TOP 3 employees.first_name, employees.last_name,  count(*) as passes_sold
From employees, passes
Where employees.employee_id = passes.employee_id and year(purchase_date)=2017
Group by employees.first_name, employees.last_name
Order by passes_sold desc
--Answer: Fransisco Berthel, Ella Essex, Elysee Dallemore


--Question 19: What are the three employees that have sold the most ticktes in 2016?
Select TOP 3 employees.first_name, employees.last_name,  count(*) as tickets_sold
From employees, tickets
Where employees.employee_id = tickets.employee_id and year(purchase_date)=2016
Group by employees.first_name, employees.last_name
Order by tickets_sold desc
--Answer: Neall M'Quharge, Hermon Hailwood, Bridgette Purchon


--Question 20: What are the three employees that have sold the most ticktes in 2017?
Select TOP 3 employees.first_name, employees.last_name,  count(*) as tickets_sold
From employees, tickets
Where employees.employee_id = tickets.employee_id and year(purchase_date)=2017
Group by employees.first_name, employees.last_name
Order by tickets_sold desc
--Answer: Lissa Tesimon, Elnora Boothman, Stavros Alesanderson

--Question 21: What is the most sold cabin type in tickets in 2016?
SELECT top 1 tickets.cabin_type_id, name
from tickets, cabin_types
Where year(purchase_date)=2016 and tickets.cabin_type_id=cabin_types.cabin_type_id
group by tickets.cabin_type_id, name
order by count(*) desc
--Answer: First Class


--Question 22: What is the most sold cabin type in tickets in 2017?
SELECT top 1 tickets.cabin_type_id, name
from tickets, cabin_types
Where year(purchase_date)=2017 and tickets.cabin_type_id=cabin_types.cabin_type_id
group by tickets.cabin_type_id, name
order by count(*) desc
--Answer: First Class


--Question 23: What is the most sold cabin type in passes in 2016?
SELECT top 1 passes.cabin_type_id, name
from passes, cabin_types
Where year(purchase_date)=2016 and passes.cabin_type_id=cabin_types.cabin_type_id
group by passes.cabin_type_id, name
order by count(*) desc
--Answer: Second Class


--Question 24: What is the most sold cabin type in passes in 2017?
SELECT top 1 passes.cabin_type_id, name
from passes, cabin_types
Where year(purchase_date)=2017 and passes.cabin_type_id=cabin_types.cabin_type_id
group by passes.cabin_type_id, name
order by count(*) desc
--Answer: Second Class


--Question 25: What is the purchase location in which most tickets were sold in 2016?
SELECT top 1 purchase_location_id, locations.name, name
From tickets, locations
Where year(purchase_date)=2016 and purchase_location_id=location_id
Group by purchase_location_id, locations.name, name
--Answer: Purchase Location 1, Orlando Main Station


--Questions 26: What is the purchase location in which most tickets were sold in 2017?
SELECT top 1 purchase_location_id, locations.name, name
From tickets, locations
Where year(purchase_date)=2017 and purchase_location_id=location_id
Group by purchase_location_id, locations.name
--Answer: Purchase Loaction 7, Android App


--Question 27: What is the purchase location in which most passes were sold in 2016?
SELECT top 1 purchase_location_id, locations.name, name
From passes, locations
Where year(purchase_date)=2016 and purchase_location_id=location_id
Group by purchase_location_id, locations.name
--Answer: Purchase Loaction: 1, Orlando Main Station


--Question 28: What is the purchase location in which most passes were sold in 2017?
SELECT top 1 purchase_location_id, locations.name, name
From passes, locations
Where year(purchase_date)=2017 and purchase_location_id=location_id
Group by purchase_location_id, locations.name
--Answer: Purchase Location 1, Orlando Main Station


--Question 29: What is the purchase location in which most cards were sold in 2016?
SELECT top 1 purchase_location_id, locations.name, name
From cards, locations
Where year(purchase_date)=2016 and purchase_location_id=location_id
Group by purchase_location_id, locations.name
--Answer: Purchase Location 2, Sales Kiosk 001


--Question 30: What is the purchase location in which most cards were sold in 2017?
SELECT top 1 purchase_location_id, locations.name, name
From cards, locations
Where year(purchase_date)=2017  and purchase_location_id=location_id
Group by purchase_location_id, locations.name
--Answer: Purchase Location 4, Sales Kiosk 002

--Question 31: How many travels did not have any customers in 2016?
SELECT COUNT(DISTINCT travel_id) AS num_travels_without_customers
FROM travels tr
WHERE YEAR(date) = 2016
  AND tr.travel_id NOT IN (
    SELECT DISTINCT ti.travel_id
    FROM tickets ti
    WHERE YEAR(boarding_date) = 2016 AND customer_id IS NOT NULL);
--Answer: 103 travels had no customers


--Question 32: How many travels did not have any customers in 2017?
SELECT COUNT(DISTINCT travel_id) AS num_travels_without_customers
FROM travels tr
WHERE YEAR(date) = 2017
  AND tr.travel_id NOT IN (
    SELECT DISTINCT ti.travel_id
    FROM tickets ti
    WHERE YEAR(boarding_date) = 2017 AND customer_id IS NOT NULL);
--Answer: 105 travels had no customers


--Question 34: What is the most used payment types in tickets in 2017?
SELECT tickets.payment_type_id, COUNT(*) AS payment_count, payment_types.name
FROM tickets, payment_types
WHERE purchase_date >= '2017-01-01' AND purchase_date < '2018-01-01' AND tickets.payment_type_id = payment_types.payment_type_id
GROUP BY tickets.payment_type_id, payment_types.name
ORDER BY payment_count DESC
--Answer: The most used payment type for tickets in 2017 was payment type 1, Cash.


--Question 35: What is the most used payment types in passes in 2016?
SELECT passes.payment_type_id, COUNT(*) AS payment_count, payment_types.name
FROM passes, payment_types
WHERE purchase_date >= '2016-01-01' AND purchase_date < '2017-01-01' AND passes.payment_type_id = payment_types.payment_type_id
GROUP BY passes.payment_type_id, payment_types.name
ORDER BY payment_count DESC
--Answer: The most used payment type for passes in 2016 was payment type 7, Discover.


--Question 36: What is the most used payment types in passes in 2017?
SELECT passes.payment_type_id, COUNT(*) AS payment_count, payment_types.name
FROM passes, payment_types
WHERE purchase_date >= '2017-01-01' AND purchase_date < '2018-01-01' AND passes.payment_type_id = payment_types.payment_type_id
GROUP BY passes.payment_type_id, payment_types.name
ORDER BY payment_type_id DESC
--Answer: The most used payment type for passes in 2017 was payment type 7, Discover.

--Question 37: What is the date where the most revenue (sum of final price) in tickets was collected in 2016? 
SELECT purchase_date, SUM(final_price) AS revenue
FROM tickets
WHERE purchase_date >= '2016-01-01' AND purchase_date < '2017-01-01'
GROUP BY purchase_date
ORDER BY revenue DESC
--Answer: The date where the most revenue in tickets was collected for 2016 is 2016-11-22.

--Question 38: What is the date where the most revenue (sum of final price) in tickets was collected in 2017? 
SELECT purchase_date, SUM(final_price) AS revenue
FROM tickets
WHERE purchase_date >= '2017-01-01' AND purchase_date < '2018-01-01'
GROUP BY purchase_date
ORDER BY revenue DESC
--Answer: The date where the most revenue in tickets was collected for 2017 is 2017-11-15.


--Question 39: What is the date where the most revenue (sum of final price) in passes was collected in 2016? 
SELECT purchase_date, SUM(final_price) AS revenue
FROM passes
WHERE purchase_date >= '2016-01-01' AND purchase_date < '2017-01-01'
GROUP BY purchase_date
ORDER BY revenue DESC
--Answer: The date where the most revenue in passes was collected for 2016 is 2016-12-25.


--Question 40: What is the date where the most revenue (sum of final price) in passes was collected in 2017? 
SELECT purchase_date, SUM(final_price) AS revenue
FROM passes
WHERE purchase_date >= '2017-01-01' AND purchase_date < '2018-01-01'
GROUP BY purchase_date
ORDER BY revenue DESC
--Answer: The date where the most revenue in passes was collected for 2017 is 2017-08-16.


--Question 41: What is the hour of the day where the most tickets were sold in 2016? 
SELECT DATEPART(hour, purchase_time) AS hour_of_day, COUNT(*) AS tickets_sold
FROM tickets
WHERE YEAR(purchase_date) = 2016
GROUP BY DATEPART(hour, purchase_time)
ORDER BY COUNT(*) DESC
--Answer: The hour of the day where the most tickets were sold in 2016 was hour 7.


--Question 42: What is the hour of the day where the most tickets were sold in 2017? 
SELECT DATEPART(hour, purchase_time) AS hour_of_day, COUNT(*) AS tickets_sold
FROM tickets
WHERE YEAR(purchase_date) = 2017
GROUP BY DATEPART(hour, purchase_time)
ORDER BY COUNT(*) DESC
--Answer: the hour of the day where the most tickets were sold in 2017 was hour 21.


--Question 43: What is the hour of the day where the most passes were sold in 2016?
SELECT DATEPART(hour, purchase_time) AS hour_of_day, COUNT(*) AS passess_sold
FROM passes
WHERE YEAR(purchase_date) = 2016
GROUP BY DATEPART(hour, purchase_time)
ORDER BY COUNT(*) DESC
--Answer: The hour of the day where the most passes were sold in 2016 was hour 14. 


--Question 44: What is the hour of the day where the most passes were sold in 2017?
SELECT DATEPART(hour, purchase_time) AS hour_of_day, COUNT(*) AS passess_sold
FROM passes
WHERE YEAR(purchase_date) = 2017
GROUP BY DATEPART(hour, purchase_time)
ORDER BY COUNT(*) DESC
--Answer: The hour of the day where the most passes were sold in 2017 was hour 12. 


--Question 45: What is the hour of the day where the most cards were sold in 2016?
SELECT DATEPART(hour, purchase_time) AS hour_of_day, COUNT(*) AS cards_sold
FROM cards
WHERE YEAR(purchase_date) = 2016
GROUP BY DATEPART(hour, purchase_time)
ORDER BY COUNT(*) DESC
--Answer: The hour of the day where the most cards were sold in 2016 was hour 10.


--Question 46: What is the hour of the day where the most cards were sold in 2017?
SELECT DATEPART(hour, purchase_time) AS hour_of_day, COUNT(*) AS cards_sold
FROM cards
WHERE YEAR(purchase_date) = 2017
GROUP BY DATEPART(hour, purchase_time)
ORDER BY COUNT(*) DESC
--Answer: The hour of the day where the most cards were sold in 2017 was hour 7.


--Question 47: What are the top three cities where the most customers live in?
Select TOP 3 name, customers.city_state_id, count(*) as number_customers
from customers, cities_states 
where customers.city_state_id = cities_states.city_state_id
group by name, customers.city_state_id 
order by number_customers desc
--Answer: Tampa, Orlando, Bruce


--Question 48: What are the top two cities where the most employees live?
Select TOP 2  name, employees.city_state_id, count(*) as number_employees
from employees, cities_states 
where employees.city_state_id = cities_states.city_state_id
group by name, employees.city_state_id 
order by number_employees desc
--Answer: Tampa and Orlando


--Question 49: What are the six zip codes where the most customers live in?
Select  TOP 6 customers.zipcode_id, name, count(*) as number_customers
From customers, zipcodes
Where customers.zipcode_id = zipcodes.zipcode_id
Group by customers.zipcode_id, name
Order by number_customers desc
--Answer: 10604, 10627, 10606, 10602, 10620


--Questions 50: What are the six zip codes where the most employees live?
Select  TOP 6 employees.zipcode_id, name, count(*) as number_employees
From employees, zipcodes
Where employees.zipcode_id = zipcodes.zipcode_id
Group by employees.zipcode_id, name
Order by number_employees desc
--Answer: 10600, 10604, 10608, 10610, 10620, 106627


--Question 51: What are the three customers that bought the most tickets in 2016?
Select TOP 3 customers.customer_id, customers.first_name, customers.last_name, count(*) as number_tickets
From customers, tickets
Where customers.customer_id = tickets.customer_id and year(purchase_date) = 2016
Group by customers.customer_id, customers.first_name, customers.last_name
Order by number_tickets desc
--Answer: Jeannie Mowsdill, Jenda Brazelton, Krystyna Twedell


--Question 52: What are the top 3 customers that bought the most tickets in 2017?
Select TOP 3 customers.customer_id, customers.first_name, customers.last_name, count(*) as number_tickets
From customers, tickets
Where customers.customer_id = tickets.customer_id and year(purchase_date) = 2017
Group by customers.customer_id, customers.first_name, customers.last_name
Order by number_tickets desc
--Answer: Bennie Woolaghan, Luis Garces, Alejandro Briat