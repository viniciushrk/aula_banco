/* comando drop é utilizado para excluir um Banco de Dados*/
/*drop database livraria;*/
/* Cria um Banco de Dados*/
create database livraria;
/* Indica qual Banco de Dados será usado*/
use livraria;
/* create criando as tabelas cliente*/

create table cliente(
	id_cliente int primary key auto_increment,
    cpf varchar(100),
    cnpj varchar(100),
    nome varchar(100),
    email varchar(50),
    telefone varchar(20),
    tipo char(1)
);
create table livros(
	id_livro int primary key auto_increment,
    titulo varchar(50), 
    autor varchar(100),
    ano int(5),
    valor float(10,2),
    qtde int(5)
);
create table editora(
	id_editora int primary key auto_increment,
    nome varchar(100),
    gerente varchar(100),
    telefone varchar(20),
    id_livro int not null,
    /* 
       Criando relacionamento 1 x N entre as tabelas livro e editora.
			Dica: em relacionamento 1 X N, a Cardinalidade fica na entidade N
				  Em Relacionamento 1 x 1, a Cardinalidade fica na entidade mais fraca
    */
    foreign key (id_livro) references livros(id_livro)
);
create table compra(
	id_compra int primary key auto_increment,
	id_cliente int,
    id_livro int,
    
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_livro) references livros(id_livro)
);

insert into cliente values(null, '50619190094', null, 'Paulo José', 'paulo@gmial.com','(94) 97903-1123','F');
insert into cliente values(null, '05898535039', null, 'Mateus Castro', 'mateus@gmial.com','2617-6426','F');
insert into cliente values(null, '05272417097', null, 'Emanuele Gaspar', 'emanuele@gmial.com','(65) 96850-4220','F');
insert into cliente values(null, '04704158004', null, 'Carlos Aparecido', 'carlos@gmial.com','(84) 98974-3382','F');
insert into cliente values(null, '77363615098', null, 'Carla Santana', 'carla@gmial.com','(82) 97213-8883','F');
insert into cliente values(null, '06132349014', null, 'Fernanda Santana', 'carla@gmial.com','(75) 99578-8361','F');

insert into cliente values(null, null, '53673761000170', 'Victor Ximenes Caruso Alfradique', 'maiara.geraldo@geradornv.com.br','(75) 99578-8361','J');
insert into cliente values(null, null, '95150879000164', 'Nara Helena Paes dos Anjos Mayerhofer', 'lilian.sousa@geradornv.com.br','(95) 2231-6312','J');
insert into cliente values(null, null, '65314482000108', 'Thainá Marotti Latin Cruz', 'emanoel.mata@geradornv.com.br','(96) 3735-8033','J');
insert into cliente values(null, null, '88836375000137', 'Gleyce Arlia Medel', 'gleyce.medel@geradornv.com.br','(97) 2557-7703','J');
insert into cliente values(null, null, '38370481000108', 'Elizabeth Inácio Lucio', 'elizabeth.lucio@geradornv.com.br','(61) 2521-51561','J');
insert into cliente values(null, null, '97105311000157', 'Luiz Teixeira Tavares', 'luiz.tavares@geradornv.com.br','(75) 2446-2707','J');

insert into livros values(null, 'Aprendendo Banco de Dado na SAPIENS', 'Juan Bochimpani Camelo Coimbra', 2020, 29.69, 10 );
insert into livros values(null, 'SQL para leigos', 'Nathan Ximenes Paulino França', 2019, 30.69, 20);
insert into livros values(null, 'Habitos Saudáveis', 'Francisca Mello Paixão Gouveia', 2016, 50.00, 30);
insert into livros values(null, 'A Casa Marrom', 'André Gomes Loureiro Dores', 2014, 70.00, 50);
insert into livros values(null, 'Pra sempre amiga', 'Brunna Auzier Vilela Cavalcante', 2000, 80.00, 50);
insert into livros values(null, 'O poder da mente', 'Vanderlei Manhães Gabrig Neves', 2022, 100.00, 100);
insert into livros values(null, 'Sistemas Operacionais Moderno', 'Andrew Tanenbaum', 2016, 200.00, 100);
insert into livros values(null, 'Cavaleiro Real', 'Mariza Passos Rios Caldas', 2016, 200.00, 100);
insert into livros values(null, 'Pessoas Efetivas', 'Eduardo Santos', 2016, 200.00, 100);
insert into livros values(null, 'Começando com Bando Dados', 'Dalva da Sousa Figueiras Peixoto', 2016, 200.00, 100);

insert into editora values(null, 'Atlas', 'Raphael Luques Pena', '(53) 3853-4967',1);
insert into editora values(null, 'Addison', 'GABRIELA', '(88) 3047-9311',2);
insert into editora values(null, 'Beta', 'THIAGO', '(47) 3357-3514',4);
insert into editora values(null, 'Bubba', 'EDUARDO', '(47) 3453-2447',3);
insert into editora values(null, 'Insignia', 'MAIARA', '(82) 3113-1232',1);
insert into editora values(null, 'Continental', 'ADRIANA', '(42) 2035-6875',1);

insert into compra values(null,1,1);
insert into compra values(null,1,2);
insert into compra values(null,3,2);
insert into compra values(null,4,1);
insert into compra values(null,1,5);
insert into compra values(null,4,1);
insert into compra values(null,4,1);
insert into compra values(null,4,6);
insert into compra values(null,12,7);
insert into compra values(null,10,2);
insert into compra values(null,5,3);
insert into compra values(null,8,1);
insert into compra values(null,4,6);
insert into compra values(null,3,3);
insert into compra values(null,4,1);
insert into compra values(null,9,5);
insert into compra values(null,10,1);
insert into compra values(null,11,6);
insert into compra values(null,10,1);
insert into compra values(null,1,10);
insert into compra values(null,1,4);
insert into compra values(null,1,1);