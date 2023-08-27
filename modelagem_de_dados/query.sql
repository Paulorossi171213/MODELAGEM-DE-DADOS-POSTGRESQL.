--Criação do banco de dados Ecommerce
create database ecommerce;

--Criação da tabela clientes
CREATE TABLE clientes (
cpf varchar(11) unique not null ,
nome varchar (150) not null 
);
--Criação da tabela vendedores
CREATE TABLE vendedores (
cpf varchar(11) unique not null ,
nome varchar (150) not null 
);
--Criação da tabela categorias
CREATE TABLE categorias (
id serial primary key,
nome varchar (50) not null 
);

--Criação da tabela pedidos
create table pedidos(
id serial primary key,
valor integer not null,
cpf_cliente char(11) not null references clientes(cpf),
cpf_vendedor char(11) not null references vendedores(cpf)
);

--Criação da tabela itens_do_pedidos
create table itens_do_pedido(
id serial primary key,
quantidade integer not null,
pedidos_id integer not null references pedidos(id),
produto_id integer not null references produtos(id)
);

--Criação da tabela produtos
create table produtos(
id serial primary key,
nome varchar(100)not null,
descricao text,
preco int not null,
quantidade_em_estoque int not null,
categoria_id int NOT NULL references categorias(id)	  
);

--Alimentando a tabela categorias
insert into categorias (nome)
values
('frutas'),('verduras'), ('massas'),('bebidas'),('utilidades');

--Criação da tabela produtos
CREATE TABLE produtos(
id serial primary key,
nome text  not null,
descricao text,
preco text not null,
quantidade_em_estoque text not null,
categoria_id integer references categorias(id) 
);

--Alimentando a tabela produtos
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id)
values
('Mamão',' Rico em vitamina A, potássio e vitamina',' 300 ','123',1),
('Maça',' Fonte de potássio e fibras',' 300 ','123',1),
('Cebola',' Rico em quercetina, antocianinas, vitaminas do complexo B, C.',' 50','76',2),
('Abacate',' NÃO CONTÉM GLÚTEN.',' 150 ','64',1),
('Tomate','Rico em vitaminas A, B e C.',' 125 ','88',2),
('Acelga',' NÃO CONTÉM GLÚTEN.',' 235 ','13',2),
('Macarrão parafuso',' Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais',' 690 ','5',3),
('Massa para lasanha','Uma reunião de família precisa ter comida boa e muita alegria.',' 875 ','19',3),
(' Refrigerante coca cola lata',' Sabor original',' 350 ','189',4),
('Refrigerante Pepsi 2l',' NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.',' 700 ','12',4),
('Cerveja Heineken 600ml','heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado',' 1200 ','500',4),
('Agua mineral sem gás',' Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.',' 130 ','478',4),
('Vassoura',' Pigmento, matéria sintética e metal.',' 2350 ','30',5),
('Saco para lixo',' Reforçado para garantir mais segurança',' 1340 ','	90',5),
('Escova dental','Faça uma limpeza profunda com a tecnologia inovadora',' 1000 ','44',5),
('Balde para lixo 50l','possui tampa e fabricado com material reciclado',' 2290 ','55',5),
('Manga','Rico em Vitamina A, potássio e vitamina C',' 198 ','176',1),
('Uva','NÃO CONTÉM GLÚTEN.',' 420 ','90',1);

--Alimentando a tabela clientes
insert into clientes (cpf,nome)
values
('80371350042','José Augusto Silva'),
('67642869061','Antonio Oliveira'),
('63193310034','Ana Rodrigues'),
('75670505018','Maria da Conceição');

--Alimentando a tabela vendedores
insert into vendedores (cpf,nome)
values
('82539841031', 'Rodrigo Sampaio'),
('23262546003', 'Beatriz Souza Santos'),
('28007155023', 'Carlos Eduardo');

-- Agora que o banco de dados está alimentado, vamos realizar algumas vendas. 
--Sendo assim, segue um relatórios para que as vendas sejam lançadas.

--Obs.: Sempre que lançar uma venda, será necessário abater as quantidades no estoque dos produtos
-- vendidos antes de uma nova venda.

--a) José Algusto comprou os seguintes itens com o vendedor Carlos Eduardo:

-- 1 Mamão, 1 Pepsi de 2l, 6 Heinekens de 600ml, 1 Escova dental e 5 Maçãs.


insert into pedidos(valor,cpf_cliente,cpf_vendedor)
values
(1700,80371350042,28007155023);

insert into itens_do_pedido(quantidade,pedidos_id,produto_id)
values
(1,1,1),
(1,1,10),
(6,1,11),
(1,1,15),
(3,1,2);

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 1;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 10;
  

update produtos set quantidade_em_estoque = quantidade_em_estoque - 6
where id = 11;


update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 15;


update produtos set quantidade_em_estoque = quantidade_em_estoque - 3
where id = 2;
  

--b) Ana Rodrigues comprou os seguintes itens com a vendedora Beatriz Souza Santos

--10 Mangas, 3 Uvas, 5 Mamões, 10 tomates e 2 Acelgas.
  

insert into pedidos(valor,cpf_cliente,cpf_vendedor)
values
(6460,63193310034,23262546003);

insert into itens_do_pedido(quantidade,pedidos_id,produto_id)
values
(10,2,17),
(3,2,18),
(5,2,1),
(10,2,5),
(2,2,6);


update produtos set quantidade_em_estoque = quantidade_em_estoque - 10
where id = 17;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 3
where id = 18;
  

update produtos set quantidade_em_estoque = quantidade_em_estoque - 5
where id = 1;


update produtos set quantidade_em_estoque = quantidade_em_estoque - 10
where id = 5;


update produtos set quantidade_em_estoque = quantidade_em_estoque - 2
where id = 6;
  

-- Maria da Conceição comprou os seguintes itens com a vendedora Beatriz Souza Santos

-- 1 Vassoura, 6 Águas sem gás e 5 Mangas.

insert into pedidos(valor,cpf_cliente,cpf_vendedor)
values
(3538,75670505018,23262546003);

insert into itens_do_pedido(quantidade,pedidos_id,produto_id)
values
(1,3,13),
(6,3,12),
(5,3,17);


update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 13;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 6
where id = 12;
  

update produtos set quantidade_em_estoque = quantidade_em_estoque - 5
where id = 17;


--d) Maria da Conceição comprou os seguintes itens com o vendedor Rodrigo Sampaio

--1 Balde para lixo, 6 Uvas, 1 Macarrão parafuso, 3 Mamões, 20 tomates e 2 Acelgas.

insert into pedidos(valor,cpf_cliente,cpf_vendedor)
values
(9370,75670505018,82539841031);

insert into itens_do_pedido(quantidade,pedidos_id,produto_id)
values
(1,4,16),
(6,4,18),
(1,4,7),
(3,4,1),
(20,4,5),
(2,4,6);

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 16;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 6
where id = 18;
  

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 7;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 3
where id = 1;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 20
where id = 5;
  

update produtos set quantidade_em_estoque = quantidade_em_estoque - 2
where id = 6;

--e) Antonio Oliveira comprou os seguintes itens com o vendedor Rodrigo Sampaio

-- 8 Uvas, 1 Massa para lasanha, 3 Mangas, 8 tomates e 2 Heinekens 600ml


insert into pedidos(valor,cpf_cliente,cpf_vendedor)
values
(8229,67642869061,82539841031);

insert into itens_do_pedido(quantidade,pedidos_id,produto_id)
values
(8,5,18),
(1,5,8),
(3,5,17),
(8,5,5),
(2,5,11);


update produtos set quantidade_em_estoque = quantidade_em_estoque - 8
where id = 18;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1
where id = 8;
  

update produtos set quantidade_em_estoque = quantidade_em_estoque - 3
where id = 17;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 8
where id = 5;

update produtos set quantidade_em_estoque = quantidade_em_estoque - 2
where id = 11;
  
