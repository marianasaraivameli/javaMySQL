DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

create table autor(
	`id_autor` int NOT NULL PRIMARY KEY ,
    `nome` varchar(100),
    `nacionalidade` varchar(100)
);

insert into autor values
(1, 'Cecília Meirelles', 'Brasil'),
(2, 'J. K. Rowling', 'Reino Unido'),
(3, 'William Shakespeare', 'Reino Unido'),
(4, 'Jane Austen', 'Reino Unido'),
(5, 'Julia Quinn', 'Reino Unido');


create table livro(
	`id_livro` int NOT NULL PRIMARY KEY ,
    `titulo` varchar(100),
    `editora` varchar(100),
    `area` varchar(100)
);

insert into livro values
(1, 'Ou isto ou Aquilo', 'Global', 'Literatura Infantil' ),
(2, 'Harry Potter e a Pedra Filosofal', 'Bloomsbury Publishing', 'Fantasia e Ficção'),
(3, 'Romeu e Julieta', 'Reino Unido', 'Tragédia'),
(4, 'Orgulho e Preconceito', 'Editorial Record', 'Romance'),
(5, 'O duque e eu', 'Editora Arqueiro', 'Romance');


create table livro_autor(
	`id_livro` int,
    `id_autor` int,
    FOREIGN KEY `livro_autor_livro`(`id_livro`) REFERENCES `livro` (`id_livro`),
    FOREIGN KEY `livro_autor_autor`(`id_autor`) REFERENCES `autor` (`id_autor`)
);

insert into livro_autor values
(1,  1),
(2,  2),
(3,  3),
(4,  4),
(5,  5);

create table aluno(
	`id_aluno` int NOT NULL PRIMARY KEY ,
    `nome` varchar(100),
    `sobrenome` varchar(100),
    `endereco` varchar(100),
    `carreira` varchar(100),
    `idade` int
);

insert into aluno values
(1, 'Mariana', 'Saraiva', 'Prado', 'Desenvolvedor Web', 36),
(2, 'Thiago', 'Cirilo', 'Castelo', 'Músico', 40),
(3, 'Olívia', 'Abrãa', 'Gutierrez', 'Administrador', 36),
(4, 'Marina', 'Gervásio', 'Nova Granada', 'Fonoaudiologia', 28),
(5, 'Manuela', 'Moss', 'Cascais', 'Desenvolvedor Web', 29);

create table livro_aluno_emprestimo(
	`id_leitor` int,
    `id_livro` int,
    `data_emprestimo` datetime,
    `data_devolucao` datetime,
    `retornou` varchar(50),
    FOREIGN KEY `livro_leitor`(`id_leitor`) REFERENCES `aluno` (`id_aluno`),
    FOREIGN KEY `livro_emprestimo`(`id_livro`) REFERENCES `livro` (`id_livro`)
);

insert into livro_aluno_emprestimo values
(1,  2, '2017-01-01 00:00:00', '2017-02-01 00:00:00', null),
(2,  5, '2018-01-01 00:00:00', '2018-02-01 00:00:00', null),
(3,  4, '2019-01-01 00:00:00', '2019-02-01 00:00:00', null),
(4,  1, '2020-01-01 00:00:00', '2020-02-01 00:00:00', null),
(5,  3, '2021-01-01 00:00:00', '2021-02-01 00:00:00', null);

-- 1. Listar os dados dos autores.
select * from autor;

-- 2. Listar nome e idade dos alunos
select nome, sobrenome, idade from aluno;

-- 3. Quais alunos pertencem à carreira de desenvolvimento?
select nome, sobrenome, carreira from aluno where carreira = "Desenvolvedor Web";

-- 4. Quais autores são de nacionalidade Reino Unido?
select * from autor where nacionalidade = "Reino Unido";

-- 5. Que livros não são Romance?
select * from livro where not area = "Romance";

-- 6. Listar os livros da editora Global.
select * from livro where editora = "Global";

-- 7. Listar os dados dos alunos cuja idade é maior que a média.
select nome, sobrenome, idade from aluno where idade > (
select round(AVG(idade), 2) from aluno);

-- 8. Listar os nomes dos alunos cujo sobrenome começa com a letra G.
select nome, sobrenome from aluno where sobrenome like "G%";

-- 9. Listar os autores do livro "O duque e eu". (Apenas nomes devem ser listados.)
select a.nome from livro_autor as la
inner join autor as a on la.id_autor = a.id_autor
inner join livro as l on la.id_livro = l.id_livro
where l.titulo = "O duque e eu";

-- 10. Listar autores que tenham nacionalidade Brasil.
select a.nome from livro_autor as la
inner join autor as a on la.id_autor = a.id_autor
inner join livro as l on la.id_livro = l.id_livro
where a.nacionalidade = "Brasil";

-- 11. Que livros foram emprestados ao leitor “Mariana Saraiva”?
select l.titulo from livro_aluno_emprestimo as lae
inner join aluno as a on lae.id_leitor = a.id_aluno
inner join livro as l on lae.id_livro = l.id_livro
where a.nome = 'Mariana' and a.sobrenome = 'Saraiva';

-- 12. Listar o nome do aluno mais novo.
select a.nome, a.sobrenome, a.idade from livro_aluno_emprestimo as lae
inner join aluno as a on lae.id_leitor = a.id_aluno
inner join livro as l on lae.id_livro = l.id_livro
order by a.idade limit 1;

-- 13. Listar os nomes dos alunos a quem os livros de Banco de Dados foram emprestados.
select a.nome, l.titulo from livro_aluno_emprestimo as lae
inner join aluno as a on lae.id_leitor = a.id_aluno
inner join livro as l on lae.id_livro = l.id_livro;

-- 14. Listar os livros que pertencem ao autor J. K. Rowling.
select l.titulo from livro_autor as la
inner join autor as a on la.id_autor = a.id_autor
inner join livro as l on la.id_livro = l.id_livro
where a.nome = "J. K. Rowling";

