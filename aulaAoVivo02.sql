use movies_db;

create temporary table actors_temp
select first_name, last_name
from actors
where rating > 5;

select * from actors_temp;

select first_name from actors_temp where first_name like "%Sam%";

select count(*) from genres; -- 12

select count(*) from movies; -- 21

select count(*) from genres, movies; -- 252

select count(*)
from genres as g
inner join movies as m
on g.id = m.genre_id; -- 19

-- filmes sem generos cadastrados;
select * from movies where genre_id is null; -- 2 casos

select m.title, g.name
from genres as g
right join movies as m
on g.id = m.genre_id;

select m.title, g.name
from genres as g
right join movies as m
on g.id = m.genre_id
Union
select m.title, g.name
from genres as g
left join movies as m
on g.id = m.genre_id;

