create database IF NOT EXISTS livraria; 

use livraria;

create table IF NOT EXISTS livros (
	id_livro int AUTO_INCREMENT primary key,
	isbn varchar(15), 
	titulo varchar (255), 
	ano year, 
	autor varchar (25)
);

insert into livros (isbn, titulo, ano, autor) 
	values ('312321', 'Olá mundo', 1990, 'delicinha dev');

 create table IF NOT EXISTS cliente(
	id_cliente int AUTO_INCREMENT primary key, 
	cpf varchar(15), 
	nome varchar(255), 
	email varchar(55)
);

create table IF NOT EXISTS editora (
	id_editora int AUTO_INCREMENT primary key, 
	nome varchar (255),
	cnpj varchar (255),
	tipo varchar (10),
	id_livro int,
	foreign key (id_livro) references livros (id_livro)
);

create table IF NOT EXISTS compra(
	id_compra int AUTO_INCREMENT primary key,
	id_cliente int, 
	id_livro int,
	foreign key (id_cliente) references cliente  (id_cliente),
	foreign key (id_livro) references livros (id_livro)
);



