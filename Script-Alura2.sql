-- cola aqui a parte e vcs com um espaçamento das dos outros

create table curso (
	curso_id serial primary key,
	nome_curso varchar (60),
	descricao text,
	duracao int,
	ultima_atualizacao timestamp	
);

create table categoria(
	categoria_id serial primary key,
	nome_categoria varchar (30),
	ultima_atualizacao timestamp
);

create table curso_categoria(
	curso_id int,
	categoria_id int,
	ultima_atualizacao timestamp
);

create table planos (
	planos_id serial primary key,
	nome_plano char(6),
	vencimento time, 
	valor numeric (6, 2),
	ultima_atualizacao timestamp
);

create table pagamento(
	pagamento_id serial primary key,
	planos_id int,
	dia_pagamento time, 
	usuario_id int,
	ultima_atualizacao timestamp
);

create table usuario (
	usuario_id serial primary key,
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
	video_aula_id serial primary key,
	curso_id int, 
	nome_video_aula varchar(30)
);

-- de cima fechado

-- Tabela: curso_categoria
ALTER TABLE curso_categoria
ADD CONSTRAINT fk_curso_categoria_curso
FOREIGN KEY (curso_id)
REFERENCES curso(curso_id);

ALTER TABLE curso_categoria
ADD CONSTRAINT fk_curso_categoria_categoria
FOREIGN KEY (categoria_id)
REFERENCES categoria(categoria_id);

-- Tabela: video_aula
ALTER TABLE video_aula
ADD CONSTRAINT fk_video_aula_curso
FOREIGN KEY (curso_id)
REFERENCES curso(curso_id);

-- Tabela: usuario
ALTER TABLE usuario 
ADD CONSTRAINT fk_usuario_planos
FOREIGN KEY (planos_id) 
REFERENCES planos(planos_id);

ALTER TABLE usuario
ADD CONSTRAINT fk_usuario_curso
FOREIGN KEY (curso_id) 
REFERENCES curso(curso_id);

-- Tabela: pagamento
ALTER TABLE pagamento
ADD CONSTRAINT fk_pagamento_planos
FOREIGN KEY (planos_id) 
REFERENCES planos(planos_id);

ALTER TABLE pagamento
ADD CONSTRAINT fk_pagamento_usuario
FOREIGN KEY (usuario_id) 
REFERENCES usuario(usuario_id);

alter table pagamento add column dia_pagamento date; 


insert into usuario(planos_id, curso_id, nome_usuario, sobrenome, email, senha, data_de_criacao, cpf, ultima_atualizacao)
values (1, 1, 'João', 'Accácio', 'joao.alves@gmail.com', 'alves123', '23-09-18', '1112223334', '2025-07-01 12:51:43'),
(2, 2, 'Rafael', 'Saldanha', 'rafael.costa@gmail.com', 'costa123', '08-07-25', '55566777888', '2025-07-02 14:30:00'),
(3, 3, 'João', 'Gabriel', 'joao.arandas@gmail.com', 'arandas123', '20-01-21', '99988877766', '2025-07-03 16:00:01');


insert into planos (nome_plano, vencimento, valor, ultima_atualizacao)
values ('Plus', '2025-12-31' , 1308.01, '2024-12-30 15:54:00' ),
('Pro', '2026-07-04', 1788.01 , '2025-07-03 18:08:00'),
('Ultra', '2026-03-02' ,2508.01 , '2025-03-01 19:44:00');


insert into pagamento (planos_id, dia_pagamento, usuario_id, ultima_atualizacao)
values (1, '2026-01-01', 10, '2024-12-30 15:54:00'),
(2, '2026-07-05', 11, '2025-07-03 18:08:00'),
(3, '2026-03-03', 12, '2025-03-01 19:44:00');


insert into curso (nome_curso, descricao, duracao, ultima_atualizacao)
values ('SQL e Banco de Dados', 'Primeira aula de SQL e Banco de Dados', 20, '2025-06-06 12:00:00'),
('Python', 'Primeira aula de Pyhton', 35, '2025-07-05 18:00:00'),
('Geografia', 'Aula sobre as características das placas tectônicas e seus movimentos', 12, '2025-06-29 18:00:00');


insert into video_aula (curso_id, nome_video_aula)
values (1, 'Meu Primerio Banco de Dados'),
(2, 'Meu Primeiro Código em Python'),
(3, 'Placas Tectônicas');


insert into curso_categoria (curso_id, categoria_id, ultima_atualizacao)
values (1, 1, '2025-06-06 12:00:00'),
(2, 2, '2025-07-05 18:00:00'),
(3, 3, '2025-06-29 18:00:00');


insert into categoria (nome_categoria, ultima_atualizacao)
values ('Data_Science', '2025-06-06 12:00:00'),
('Programação', '2025-07-05 18:00:00'),
('Outro', '2025-06-29 18:00:00');

--obs alguns alter table não estão presentes

--update usuario set email = 'teste@teste' where usuario_id = 1; 


--selects

--select count(nome_usuario) as "quantidade de alunos" from usuario u;

--select count(*) as "cursos disponiveis" from curso c;

--select count(*) as "quantidade de planos em uso por clientes" from usuario u
--inner join planos p
--on u.planos_id = p.planos_id;
