CREATE DATABASE IF NOT EXISTS BANCARIO;
USE BANCARIO;
CREATE TABLE IF NOT EXISTS cliente (
   nome_cliente varchar(25) NOT NULL, 
   endereco varchar(40), 
   bairro_cliente varchar(20)
); 
ALTER TABLE cliente ADD CONSTRAINT cliente_PK PRIMARY KEY (nome_cliente); 

CREATE TABLE agencia(
   nome_agencia varchar(20) NOT NULL, 
   patrimonio decimal(12,2), 
   bairro_agencia varchar(20)
); 
ALTER TABLE agencia ADD CONSTRAINT agencia_PK PRIMARY KEY (nome_agencia); 

CREATE TABLE deposito (
   nome_agencia varchar(20) NOT NULL, 
   numero_conta char(7),
   nome_cliente varchar(25) NOT NULL,
   saldo decimal(10,2)
); 
ALTER TABLE deposito ADD CONSTRAINT deposito_PK PRIMARY KEY (nome_agencia, nome_cliente); 

CREATE TABLE emprestimo (
   nome_agencia varchar(20) NOT NULL, 
   numero_emprestimo char(8),
   nome_cliente varchar(25) NOT NULL,
   valor decimal(10,2)
); 
ALTER TABLE emprestimo ADD CONSTRAINT emprestimo_PK PRIMARY KEY (nome_agencia, nome_cliente); 

ALTER TABLE deposito ADD CONSTRAINT FK_DepAge FOREIGN KEY (nome_agencia) REFERENCES agencia(nome_agencia);
ALTER TABLE deposito ADD CONSTRAINT FK_DepCli FOREIGN KEY (nome_cliente) REFERENCES cliente(nome_cliente);
ALTER TABLE emprestimo ADD CONSTRAINT FK_EmpAge FOREIGN KEY (nome_agencia) REFERENCES agencia(nome_agencia);
ALTER TABLE emprestimo ADD CONSTRAINT FK_EmpCli FOREIGN KEY (nome_cliente) REFERENCES cliente(nome_cliente);

insert into cliente values ('João Carlos','Av. Dr. Arnaldo, 647','Sumará');
insert into cliente values ('João Alberto','Al. Fernão Cardim, 52','Cerqueira César');
insert into cliente values ('Sílvio Luis','R. Gaivota, 129','Moema');
insert into cliente values ('Heraldo Fransão','R. Valencia, 223','Sumará');
insert into cliente values ('Carlos Machado','Av. Rouxinol, 114','Moema');
insert into cliente values ('Luis Nascimento','Rua Cardeal Arcoverde, 517','Pinheiros');
insert into cliente values ('Tiago de Jesus','Rua Manuel Dutra, 35','Bela Vista');
insert into cliente values ('Welington dos Santos','R. Da. Antonia de Queirões, 373','Consolação');
insert into cliente values ('Glaucia Marta','R. Ipanema, 174','Hip�dromo');
insert into cliente values ('Benedito Mota','Al. Campinas, 627','Cerqueira César');
insert into cliente values ('Gilberto de Castro','R. Conselheiro Ramalho, 312','Bela Vista');
insert into cliente values ('Antônio Carlos','R. Aspicuelta, 211','Pinheiros');
insert into cliente values ('João Mauro','Al. Campinas, 333','Cerqueira César');

insert into agencia values ('Paulista', 0009000000.00,'Cerqueira César');
insert into agencia values ('Brigadeiro', 0002100000.00,'Cerqueira César');
insert into agencia values ('Pompéia', 0001700000.00,'Perdizes');
insert into agencia values ('Indianápolis', 0000400000.00,'Moema');
insert into agencia values ('Giovani Gronchi', 0008000000.00,'Morumbi');
insert into agencia values ('Francisco Morato', 0000300000.00,'Vila Sônia');
insert into agencia values ('Ibirapuera', 0003700000.00,'Moema');
insert into agencia values ('Santo Amaro', 0007100000.00,'Brooklin Novo');

insert into deposito values ('Paulista','04620-8','João Alberto',+00000500.00);
insert into deposito values ('Brigadeiro','03728-0','Sílvio Luis',+00000700.00);
insert into deposito values ('Pompéia','01744-9','Heraldo Fransão',+00000400.00);
insert into deposito values ('Indianápolis','07239-2','Tiago de Jesus',+00000350.00);
insert into deposito values ('Pompéia','01246-7','Welington dos Santos',+00000900.00);
insert into deposito values ('Giovani Gronchi','02527-1','Luis Nascimento',+00000700.00);
insert into deposito values ('Santo Amaro','09741-3','Gilberto de Castro',+00000750.00);
insert into deposito values ('Paulista','04222-3','Gilberto de Castro',+00000850.00);
insert into deposito values ('Brigadeiro','03241-9','João Alberto',+00001180.00);

insert into emprestimo values ('Paulista','17-00-C1','João Carlos',+00001900.00);
insert into emprestimo values ('Santo Amaro','23-99-C1','Sílvio Luis',+00002200.00);
insert into emprestimo values ('Pompéia','14-99-C3','Heraldo Fransão',+00001800.00);
insert into emprestimo values ('Brigadeiro','93-99-C2','Carlos Machado',+00001700.00);
insert into emprestimo values ('Indianápolis','18-00-C3','Tiago de Jesus',+00001900.00);
insert into emprestimo values ('Francisco Morato','22-99-C1','Welington dos Santos',+00001200.00);
insert into emprestimo values ('Ibirapuera','15-00-C2','Antônio Carlos',+00001900.00);
insert into emprestimo values ('Paulista','16-99-C3','João Alberto',+00002000.00);
insert into emprestimo values ('Pompéia','22-00-C1','Glaucia Marta',+00002200.00);
insert into emprestimo values ('Santo Amaro','10-00-C1','Benedito Mota',+00001800.00);
insert into emprestimo values ('Paulista','14-00-C1','João Mauro',+00001800.00);

/*
Requisitos para fazer o exercício:
criar uma base de dados com o nome: agencia_notifications:
Ter na base de dados agencia_notifications a tabela(tb_notifications)
Ter na Base de Dados agencia_notifications a tabela(tb_cliente_bkp)

Exercícios

1 - Criar um trigger que sempre que for inserido um novo cliente seja gravado também na tabela tb_notifications com as seguintes informações:
	(Nome do Cliente, uma msg:"um novo cliente foi inserido" e data e hora que o cliente foi inserido).

 2 - Criar um trigger que guarda na tabela tb_notifications os registros de um novo emprestimo, a tabela deve conter
(Nome do Cliente, uma msg:"um novo emprestimo foi inserido", data e hora que o imprestimo foi inserido e valor do imprestimo).

 3 - Crie  triggers para fazer o backup em um novo banco de dados, os cliente que for excluido das tabelas do banco de Dados Bancario.

4 - Criar um trigger que não pode haver valor de emprestimo menor que 1000.00 para valores novos.
5 - Criar um trigger onde o número da conta deve ser preemchido em novos registro de deposito, não sendo permitido valores null ou em branco.
*/