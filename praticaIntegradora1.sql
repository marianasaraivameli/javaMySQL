DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

create table departament(
	`depto_nro` varchar(10) PRIMARY KEY ,
    `nome_depto` varchar(100),
    `localizacao` varchar(100)
);

insert into departament (`depto_nro`, `nome_depto`, `localizacao`) values
('D-000-1', 'Software', 'Los Tigres'),
('D-000-2', 'Sistemas', 'Guadalupe'),
('D-000-3', 'Contabilidade', 'La Roca'),
('D-000-4', 'Vendas', 'Plata');

create table employee (
	`cod_fun` varchar(10) not null PRIMARY KEY,
    `nome` varchar(100) not null,
    `sobrenome` varchar(100) not null,
    `cargo` varchar(100),
    `data_alta` varchar(15),
    `salario` int,
    `comissao` int,
    `depto_nro` varchar(10),
	FOREIGN KEY `employee`(`depto_nro`) REFERENCES `departament` (`depto_nro`)
);

insert into employee (`cod_fun`, `nome`, `sobrenome`, `cargo`, `data_alta`, `salario`, `comissao`, `depto_nro`) values 
('E-0001', 'César', 'Piñero', 'Vendedor', '12/05/2018', 80000, 15000, 'D-000-4'),
('E-0002', 'Yosep', 'Kowaleski', 'Analista', '14/07/2015', 140000, 0, 'D-000-2'),
('E-0003', 'Mariela', 'Barrios', 'Diretor', '05/06/2014', 185000, 0, 'D-000-3'),
('E-0004', 'Jonathan', 'Aguilera', 'Vendedor', '03/06/2015', 85000, 10000, 'D-000-4'),
('E-0005', 'Daniel', 'Brezezicki', 'Vendedor', '03/03/2018', 83000, 10000, 'D-000-4'),
('E-0006', 'Mito', 'Barchuk', 'Presidente', '05/06/2014', 190000, 0, 'D-000-3'),
('E-0007', 'Emilio', 'Galarza', 'Desenvolvedor', '02/08/2014', 60000, 0, 'D-000-1');

-- 1. Selecione o nome, cargo e localização dos departamentos onde os vendedores trabalham.
select nome, cargo, localizacao
from employee
inner join departament
on employee.depto_nro = departament.depto_nro;

-- 2. Visualize departamentos com mais de cinco funcionários.
-- Não encontrei nenhum e para mostrar a query funcionando, deixei maior que 3.
select departament.nome_depto, count(employee.depto_nro) as num_colaborador_depto
from employee
inner join departament
on employee.depto_nro = departament.depto_nro
group by employee.depto_nro
having num_colaborador_depto > 2;

-- 3. Exiba o nome, salário e nome do departamento dos funcionários que têm o mesmo cargo que 'Mito Barchuk'.
select employee.nome, employee.salario, departament.nome_depto, employee.cargo
from employee
inner join departament
on employee.depto_nro = departament.depto_nro
having employee.cargo = "Presidente";

-- 4. Mostre os dados dos funcionários que trabalham no departamento de contabilidade, ordenados por nome.
select employee.nome, employee.salario, departament.nome_depto, employee.cargo
from employee
inner join departament
on employee.depto_nro = departament.depto_nro
having departament.nome_depto = "Contabilidade"
order by employee.nome;

-- 5. Mostre o nome do funcionário que tem o menor salário.
select nome, salario from employee order by salario limit 1;

-- 6. Mostre os dados do funcionário que tem o maior salário no departamento 'Vendas'.
select employee.nome, employee.salario, departament.nome_depto, employee.cargo
from employee
inner join departament
on employee.depto_nro = departament.depto_nro
having departament.nome_depto = "Vendas"
order by employee.salario desc
limit 1;

