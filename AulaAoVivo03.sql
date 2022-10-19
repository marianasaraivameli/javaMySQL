use movies_db;

SELECT * FROM movies WHERE id NOT IN (SELECT favorite_movie_id FROM actors);

select movies.title
from movies
where not exists
(select * from actors where favorite_movie_id = movies.id);

select count(*) from seasons ;

select title from series group by title;

SELECT series.title, COUNT(seasons.id)
FROM series
INNER JOIN seasons 
ON series.id = seasons.serie_id
GROUP BY series.title;

-- solução do professor: lista quantas temporadas existem para cada série
select series.title, count(*) as temporadas 
from seasons inner join series on series.id = seasons.serie_id
group by series.id
order by series.title;

-- solução do professor: lista quantas temporadas existem para a série The Walking Dead
select series.title, count(*) as temporadas 
from seasons inner join series on series.id = seasons.serie_id
where series.title = "The Walking Dead"
group by series.id
order by series.title;

-- lista quantas temporadas existem para cada série com mais de 5 temporadas
select series.title, count(*) as temporadas 
from seasons inner join series on series.id = seasons.serie_id
group by series.id
having temporadas >= 5
order by temporadas;

-- lista as 3 series com maior quantidade de temporadas
select series.title, count(*) as temporadas 
from seasons inner join series on series.id = seasons.serie_id
group by series.id
order by temporadas desc
limit 3;

--  quais os nomes dos atores que trabalham em filmes com avaliação maior que 9.1;
select first_name
from actors
inner join actor_movie on actor_id = actors.id where movie_id in 
(select id from movies where rating > 9.1);

-- solução professor:
-- 1. subconsulta: seleciona os ids dos autores que estão em filmes com avaliação > 9.1
-- 2. busca os nomes dos ids selecionados no passo 1.
-- 3. ordernar pelo first_name.
select first_name, last_name
from actors
where id in (
	select am.actor_id
	from movies as m inner join actor_movie as am on m.id = am.movie_id
    where rating > 9.1
) order by first_name;

select first_name, last_name from actors
inner join actor_movie on actor_movie.actor_id = actors.id
inner join movies on movies.id = movie_id
where movies.rating > 9.1
order by first_name desc;








