DROP DATABASE IF EXISTS normalizacao;
CREATE DATABASE normalizacao;
USE normalizacao;

create table forma_de_pagamento(
	`id_forma_pagamento` int NOT NULL PRIMARY KEY ,
    `forma_pagamento` decimal(10,0)
);

create table imposto(
	`id_imposto` int NOT NULL PRIMARY KEY ,
    `taxa_imposto` decimal(10,0)
);

create table cliente(
	`id_cliente` int NOT NULL PRIMARY KEY ,
    `nome_cliente` varchar(40),
    `sobrenome_cliente` varchar(40),
    `endereco_cliente` varchar(40)
);

create table fatura(
	`id_fatura` int NOT NULL PRIMARY KEY,
    `descricao` varchar(40),
    `quantidade` int,
    `data_fatura` datetime,
    `valor` decimal(10,0),
    `id_cliente` int,
    `id_forma_pagamento` int,
    `id_imposto` int,
    FOREIGN KEY `cliente_fatura`(`id_cliente`) REFERENCES `cliente` (`id_cliente`),
    FOREIGN KEY `forma_de_pagamento_fatura`(`id_forma_pagamento`) REFERENCES `forma_de_pagamento` (`id_forma_pagamento`),
	FOREIGN KEY `imposto_fatura`(`id_imposto`) REFERENCES `imposto` (`id_imposto`)
);


