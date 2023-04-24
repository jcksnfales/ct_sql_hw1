-- Q1: How many actors are there with the last name ‘Wahlberg’?
select count(last_name)
from actor
where last_name like 'Wahlberg';
-- A: 2 actors have the last name Wahlberg

-- Q2: How many payments were made between $3.99 and $5.99
select count(amount)
from payment
where amount > 3.99 and amount < 5.99
-- A: 0 payments were made between the amounts $3.99 and $5.99

-- Q3: What film does the store have the most of? (search in inventory)
select film_id, count(film_id)
from inventory
group by film_id
order by count(film_id) desc
-- A: The most of any film the store has is 8, and there are 72 films which the store has 8 copies of. 

-- Q4: How many customers have the last name 'William'?
select count(last_name)
from customer
where last_name like 'William';
-- A: There are 0 customers with the exact last name William (there are, however, 2 customers with last names that start with William, as shown by the query below)
select last_name
from customer
where last_name like 'William%';

-- Q5: What store employee (get the id) sold the most rentals?
select staff_id, count(staff_id)
from rental
group by staff_id;
-- A: The employee who sold the most rentals had the ID of 1, which is Mike

-- Q6: How many different district names are there?
select count(distinct district)
from address;
-- A: There are 378 different district names.

-- Q7: What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(distinct actor_id)
from film_actor
group by film_id
order by count(distinct actor_id) desc;
-- A: The film with the most actors in it was the film with ID 508, "Lambs Cincinatti", with 15 unique actors.

-- Q8: From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
select count(last_name)
from customer
where store_id = 1
and last_name like '%es';
-- A: There are 13 customers from this store with last names ending in 'es'.

-- Q9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
select amount, count(amount)
from payment 
where customer_id > 380 and customer_id < 430
group by amount 
having count(amount) > 250;
-- A: 3 payment amounts (-423.01, -425.01, and -427.01) matched the given criteria.

-- Q10: Within the film table, how many rating categories are there? And what rating has the most movies total?
select rating, count(title)
from film
group by rating;
-- A: There are 5 rating categories (G, PG, PG-13, R, and NC-17). The rating category with the most total movies is PG-13, with 223 titles.