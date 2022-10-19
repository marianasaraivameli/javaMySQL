-- Tendo o banco de dados movies_db.sql, faça:
use movies_db;
-- 1. Adicione um filme à tabela de filmes.
select * from movies;
insert into `movies` values (50, null, null, 'Orgulho e Preconceito', 9.5, 1, '2022-10-15 00:00:00', 125, 13);

-- 2. Adicione um gênero à tabela de gêneros.
select * from genres;
insert into `genres` values (13, null, null, 'Novo genero', 13, 1);

-- 3. Associe o filme do ponto 1. com o gênero criado no ponto 2.
update `movies` set genre_id = 13 where id = 50;

-- 4. Modifique a tabela de atores para que pelo menos um ator tenha o filme adicionado no ponto 1 como favorito.
select * from actors;
update `actors` set favorite_movie_id = 50 where id = 1;

-- 5. Crie uma tabela temporária da tabela filmes.
create temporary table actors_temp_pratice_integration
select * from actors;

create temporary table movies_temp_pratice_integration
select * from movies;

-- 6. Elimine dessa tabela temporária todos os filmes que ganharam menos de 5 prêmios.
select * from movies_temp_pratice_integration;
delete from movies_temp_pratice_integration where awards < 5;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- 7. Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
select g.name
from genres as g
inner join movies as m
on g.id = m.genre_id
group by g.name;

-- 8. Obtenha a lista de atores cujo filme favorito ganhou mais de 3 prêmios.
select first_name, last_name, favorite_movie_id
from actors as a
where a.favorite_movie_id in (
	select am.actor_id
	from movies as m 
    inner join actor_movie as am on m.id = am.movie_id
    where m.awards > 3
) order by first_name;
