use movies_db;

-- select * from actors;

-- select * from movies;

-- select first_name, last_name, rating from actors;

-- select title as titulo from series;

-- select first_name, last_name, rating from actors where rating > 7.5;

-- select title, rating, awards from movies where rating > 7.5 and awards > 2;

-- select title, rating from movies order by rating;

-- select title, rating from movies order by rating desc;

-- select title from movies limit 3;

-- select title, rating from movies order by rating desc limit 3;
-- upper ou lower coloca os caracteres em maiusculas ou minusculas

-- select title from movies where title like "%toy story%";

-- select first_name, last_name from actors where first_name like "Sam%";

-- mesmo retorno (2 formas de fazer)
-- select title, release_date from movies where year(release_date) >= 2004 AND year(release_date) <= 2008;
-- select title, release_date from movies where year(release_date) between 2004 AND 2008;

-- select title, rating, awards
-- from movies 
-- where rating > 3 and awards > 1 and year(release_date) between 1988 and 2009
-- order by rating;

-- insert into actors values(null, null, null, "Antonio", "Bandeira", 9.8, 1);

-- update actors set first_name="Mauri" where id=41;

-- select * from actors where id=41;

-- delete from actors where id=41;

-- select count(*) from series;

-- select round(AVG(rating), 2) as media from actors;

-- select actor_id, count(episode_id) from actor_episode group by actor_id;

-- select actor_id, count(episode_id) from actor_episode group by actor_id having count(episode_id) >= 10;

