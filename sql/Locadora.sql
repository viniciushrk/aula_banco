CREATE database LOCACAO;
USE LOCACAO ;
create table cliente (
	 cliente_cod int primary  key  auto_increment, 
	 cliente_nome varchar(50),
	 cliente_email varchar(100), 
	 cliente_cpf varchar (11) not null,
	 cliente_endereco varchar(50) not null, 
	 cliente_numero int (6)not null,
	 cliente_complemento varchar(100), 
	 cliente_cidade varchar(50) not null,
	 cliente_estado char(2) not null, 
	 dt_cadastro date not null
);
 
 create table marca (
 marca_cod int primary key  auto_increment, 
 marca_desc varchar(100) not null
);
 
 create table modelo (
 modelo_cod int primary key  auto_increment, 
 modelo_desc varchar(100) not null);

 create table automovel (
 auto_cod int primary key  auto_increment , 
 marca_cod int  not null,
 modelo_cod int not null, 
 auto_nome varchar(50) not null
);

 create table locacao (
 locacao_cod int primary key  auto_increment ,
 auto_cod int not null,
 cliente_cod int not null,
 locacao_km int(6) not null,
 dt_locacao date not null
);
 
  alter table locacao
 add constraint fk_auto_cod foreign key (auto_cod) references automovel(auto_cod);
 
 alter table locacao
 add constraint fk_cliente_cod foreign key (cliente_cod) references cliente(cliente_cod);
 
 alter table automovel
 add constraint fk_marca_cod foreign key (marca_cod) references marca(marca_cod);
 
 alter table automovel
 add constraint fk_modelo_cod foreign key (modelo_cod) references modelo(modelo_cod);
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Joao', 'joazinho@hotmail.com', '12345678900', 'R. da Chuva', 2020,
 null, 'Porto Velho', 'RO', '2005/11/20');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Carlos', 'carlinho@hotmail.com', '91294857910', 'R. da Neve', 3020,
 null, 'Porto Velho', 'RO', '2005/11/20');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Bruna', 'bruninha@hotmail.com', '12399678900', 'R. da Sol', 4040,
 null, 'Porto Velho', 'RO', '2005/11/20');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Pedro', 'pedrinho@hotmail.com', '01293567900', 'R. da Neblina', 0001,
 null, 'Porto Velho', 'RO', '2009/11/01');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Lais', 'laisinhahotmail.com', '23483678900', 'R. do Trovao', 5020,
 null, 'Porto Velho', 'RO', '2008/06/25');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Karina', 'Karinho@hotmail.com', '39576727572', 'R. Molhada', 348,
 null, 'Porto Velho', 'RO', '2010/01/03');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Bianca', 'biancazinha@hotmail.com', '38683286840', 'R. Seca', 7070,
 null, 'Porto Velho', 'RO', '2007/01/03');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Julio', 'juliozinho@hotmail.com', '93957361300', 'R. do Tiroteio', 50,
 null, 'Porto Velho', 'RO', '2009/02/03');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Lucas', 'luquinho@hotmail.com', '39965578900', 'R. Ali', 2940,
 null, 'Porto Velho', 'RO', '2009/07/03');
 
 insert into cliente (cliente_nome, cliente_email, cliente_cpf,
 cliente_endereco, cliente_numero, cliente_complemento, cliente_cidade, cliente_estado,
 dt_cadastro) values ('Fanta', 'fantinha@hotmail.com', '12665567800', 'R. da Bebida', 9320,
 null, 'Porto Velho', 'RO', '2006/04/06');
 
 
 insert into marca (marca_desc) values ('chevrolet');
 
 insert into marca (marca_desc) values ('VW');
 
 insert into marca (marca_desc) values ('Ferrari');
 
 insert into marca (marca_desc) values ('FIAT');
 
 insert into marca (marca_desc) values ('FORD');
 
 insert into marca (marca_desc) values ('HYUNDAI');
 
 insert into marca (marca_desc) values ('KIA');
 
 insert into marca (marca_desc) values ('CITROEN');
 
 insert into marca (marca_desc) values ('PEGOUT');

 insert into marca (marca_desc) values ('BUGATTI');
 
 
 insert into modelo (modelo_desc) values ('CORSA');
 
 insert into modelo (modelo_desc) values ('GOL G3');
 
 insert into modelo (modelo_desc) values ('F 250');
 
 insert into modelo (modelo_desc) values ('PALIO');
 
 insert into modelo (modelo_desc) values ('FOCUS');
 
 insert into modelo (modelo_desc) values ('SANTA FÉ');
 
 insert into modelo (modelo_desc) values ('CERATTO');
 
 insert into modelo (modelo_desc) values ('c3');
 
 insert into modelo (modelo_desc) values ('206');
 
 insert into modelo (modelo_desc) values ('VEYRON');

 

 
 insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (1, 1, 'passeio');

 insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (2, 2, 'passeio');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (3, 3, 'esportivo');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (4, 4, 'passeio');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (5, 5, 'passeio');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (6, 6, 'suv');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (7, 7, 'passeio');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (8, 8, 'passeio');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (9, 9, 'passeio');
 
  insert into automovel (marca_cod, modelo_cod, auto_nome) 
 values (10, 10, 'esportivo');

  
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (1, 1, 30000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (2, 2, 20000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (3, 3, 30000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (4, 4, 40000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (5, 5, 50000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (6, 6, 60000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (7, 7, 70000, '2010/12/02');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (8, 8, 80000, '2010/12/10');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (9, 9, 90000, '2010/12/10');
 
 insert into locacao (auto_cod, cliente_cod, locacao_km, dt_locacao)
 values (10, 10, 100000, '2010/12/10');