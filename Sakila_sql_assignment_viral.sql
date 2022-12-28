# Which actors have the first name 'Scarlett'.
select * from actor where first_name='Scarlett';

#Which actors have the last name 'Johansson'.
select * from actor where last_name='Johansson';

# How many distinct actors' last names are there?
SELECT COUNT(*) from  (select distinct last_name from actor) as Internalquery;

# Which last names are not repeated?
select last_name from actor group by last_name having count(*) = 1;

#Which last names appear more than once?
select last_name from actor group by last_name having count(*) > 1;

#Which actor has appeared in the most films?
select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as film_count from actor join film_actor using (actor_id) group by actor_id order by film_count desc limit 1;

# What is the average length of all the films in the sakila DB?
select avg(length) from film;

#What is the average length of films by category?
select category.name, avg(length) as avg_length from film join film_category using (film_id) join category using (category_id) group by category.name order by avg(length) desc;

#Which film categories are long? (compare with avg length).
#select max(select category.name, avg(length) as avg_length from film join film_category using (film_id) join category using (category_id) group by category.name order by avg(length) desc) as inner;