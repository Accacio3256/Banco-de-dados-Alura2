-- cola aqui a parte e vcs com um espaçamento das dos outros

create table curso (
	curso_id serial,
	nome_curso varchar (60),
	descricao text,
	duracao int,
	ultima_atualizacao timestamp	
);

create table categoria(
	categoria_id serial,
	nome_categoria varchar (30),
	ultima_atualizacao timestamp
);

create table curso_categoria(
	curso_id int,
	categoria_id int,
	ultima_atualizacao timestamp
);

create table planos (
	planos_id serial,
	nome_plano char(6),
	vencimento time, 
	valor numeric (6, 2),
	ultima_atualizacao timestamp
);

create table pagamento(
	pagamento_id serial,
	planos_id int,
	dia_pagamento time, 
	usuario_id int,
	ultima_atualizacao timestamp
);

create table usuario (
	usuario_id serial,
	planos_id int,
	curso_id int,
	nome_usuario char (30),
	sobrenome char (30),
	email varchar (50),
	senha varchar (30),
	data_de_criacao date,
	cpf char(11),
	ultima_atualizacao timestamp
);

create table video_aula (
	video_aula_id serial,
	curso_id int, 
	nome_video_aula varchar(30)
);
