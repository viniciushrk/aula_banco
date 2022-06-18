
/*
Requisitos para fazer o exercício:
criar uma base de dados com o nome: agencia_notifications:
Ter na base de dados agencia_notifications a tabela(tb_notifications)
Ter na Base de Dados agencia_notifications a tabela(tb_cliente_bkp)
*/
create database if not exists agencia_notifications ;
use agencia_notifications;

create table if not exists tb_cliente_bkp (
	nome_cliente varchar(25) not null,
	endereco varchar(40) default null,
	bairro_cliente varchar(20) default null
);

create table if not exists tb_notifications  (
	ID_NOTIFICATION INT PRIMARY KEY AUTO_INCREMENT,
	CLIENTE VARCHAR(50) DEFAULT NULL,
	MSG VARCHAR(100) DEFAULT NULL,
	TABELA VARCHAR(20) DEFAULT NULL,
	QUEM VARCHAR(20) DEFAULT NULL,
	DATA DATETIME DEFAULT NULL,
	VALOR_EMPRESTIMO DECIMAL(10,2)
);
/*
Exercícios

1 - Criar um trigger que sempre que for 
inserido um novo cliente seja gravado também na tabela 
tb_notifications com as seguintes informações:
(Nome do Cliente,
 uma msg:"um novo cliente foi inserido" e data e hora que o cliente foi inserido
 ).
*/
use BANCARIO;
DELIMITER $$
	CREATE TRIGGER notification_create_user
	AFTER INSERT
	ON cliente 
	FOR EACH ROW
	BEGIN 
		INSERT INTO 
			`agencia_notifications`.`tb_notifications`
			(CLIENTE,MSG,TABELA,DATA) 
		values (
			NEW.nome_cliente,
			'um novo cliente foi inserido',
			'cliente',
			NOW()
		);	
	END;$$
DELIMITER ;
show triggers ;
/*
 2 - Criar um trigger que guarda na tabela
  tb_notifications os registros de um novo emprestimo,
 a tabela deve conter (
 	Nome do Cliente,
 	uma msg:"um novo emprestimo foi inserido",
 	data e hora que o imprestimo foi inserido e
 	valor do imprestimo).
*/
use BANCARIO;
DELIMITER $$
	CREATE TRIGGER notification_create_emprestimo
	AFTER INSERT
	ON emprestimo  
	FOR EACH ROW
	BEGIN 
		INSERT INTO 
			`agencia_notifications`.`tb_notifications`
			(CLIENTE,MSG,TABELA,DATA,VALOR_EMPRESTIMO) 
		values (
			NEW.nome_cliente,
			'um novo emprestimo foi inserido',
			'emprestimo',
			NOW(),
			new.valor
		);	
	END;$$
DELIMITER ;	
show triggers ;

/*
 3 - Crie  triggers para fazer o backup em um novo banco de dados,
  os cliente que for excluido
  das tabelas do banco de Dados Bancario.
*/

use BANCARIO;
DELIMITER $$
	CREATE TRIGGER notification_delete_cliente
	after DELETE
	ON cliente  
	FOR EACH ROW
	BEGIN 
		INSERT INTO 
			`agencia_notifications`.`tb_cliente_bkp`
			(nome_cliente,endereco,bairro_cliente) 
		values (
			OLD.nome_cliente,
			OLD.endereco,
			OLD.bairro_cliente
		);	
	END;$$
DELIMITER ;	
show triggers ;
/*
4 - Criar um trigger que não pode haver valor
	de emprestimo menor que 
	1000.00 para valores novos.
*/

use BANCARIO;
DELIMITER $$
	CREATE TRIGGER notification_BEFORE_emprestimo
	BEFORE INSERT
	ON emprestimo  
	FOR EACH ROW
	BEGIN 
		if new.valor > 1000 THEN;
		end if;
	END;$$
DELIMITER ;	
show triggers ;

/*
5 - Criar um trigger onde o número da conta deve
 ser preemchido em novos registro de deposito,
não sendo permitido valores null ou em branco.
*/
