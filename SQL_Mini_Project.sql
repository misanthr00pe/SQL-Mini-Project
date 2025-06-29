use sakila;

# Task 1
select * from actor;


# Task 2(a)
select concat(first_name, last_name) as Full_name from actor;

# 2(b)
select first_name, count(first_name) as repeated_count from actor group by first_name having count(first_name) > 1 order by count(first_name) desc;

# 2(c)
select last_name, count(last_name) as repeated_count from actor group by last_name having count(last_name) > 1 order by count(last_name) desc;


# Task 3
select rating as Rating, count(title) as 'Count of movies' from film group by rating;


# Task 4
select rating as Rating, avg(rental_rate) as 'Average rental rate (in $)' from film group by rating;


# Task 5(a)
select title from film where replacement_cost<='9';

# 5(b)
select title from film where replacement_cost between 15 and 20;

# 5(c)
select title, replacement_cost, rental_rate from film 
where replacement_cost = (select MAX(replacement_cost) from film)
  and rental_rate = (select MIN(rental_rate) from film);
  
  
# Task 6
SELECT title, COUNT(actor_id) FROM film LEFT JOIN film_actor using (film_id) LEFT JOIN actor using (actor_id) GROUP BY title;


# Task 7
select title from film where title regexp ('^K') or title regexp ('^Q');


# Task 8
select first_name, last_name from actor where actor_id in (select actor_id from film_actor where film_id=(select film_id from film where title='AGENT TRUMAN'));


# Task 9
select title from film where film_id in (select film_id from film_category where category_id=(select category_id from category where name='Family'));


# Task 10
select title as Movie_name, COUNT(rental_id) as Rental_count
from film join inventory using (film_id) join rental r using (inventory_id)
group by title order by Rental_count;


# Task 11
select name as Genre, count(name) as 'No of movie category' 
from category left join film_category using (category_id) right join film using (film_id) group by name having avg(replacement_cost-rental_rate)>15;


# Task 12
select name as Genre, count(film_id) as 'No. of movies per genre' 
from category right join film_category using (category_id) right join film using (film_id) 
group by name having count(film_id) between 60 and 70 order by count(film_id) asc;

