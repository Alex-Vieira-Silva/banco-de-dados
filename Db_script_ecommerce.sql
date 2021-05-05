CREATE DATABASE Ecommerce;

USE Ecommerce;

CREATE TABLE Produtos
(id INT NOT NULL IDENTITY, codigo INT NOT NULL,
nome VARCHAR(100),
preco FLOAT NOT NULL,
descricao VARCHAR(100) NULL
CONSTRAINT pk_Produtos_id PRIMARY KEY(id)
);

CREATE TABLE Cliente
(id INT NOT NULL IDENTITY, codigo INT NOT NULL,
nome VARCHAR(100) NOT NULL, pessoa VARCHAR(20) NOT NULL,
descricao VARCHAR(200) NULL
CONSTRAINT pk_Cliente_id PRIMARY KEY(id)
);

CREATE TABLE Pedido
(id INT NOT NULL IDENTITY, codigo INT NOT NULL,
dataSolicitacao DATETIME NOT NULL,
flagPago INT NOT NULL,
totalPedido FLOAT NOT NULL,
idCliente INT NOT NULL
CONSTRAINT pk_Pedido_id PRIMARY KEY(id)
CONSTRAINT fk_Cliente_id FOREIGN KEY(idCliente)
REFERENCES Cliente (id)
);

CREATE TABLE PedidoItem
(id INT NOT NULL IDENTITY, codigoProduto INT NOT NULL,
preco FLOAT NOT NULL,
quantidade INT NOT NULL
CONSTRAINT pk_PedidoItem_id PRIMARY KEY(id)
);


--------- Inserindo, atualizando e excluindo dados nas tabelas ----------------
-- obs: o campo id de todas as tabelas são todos de preenchimento automatico.


INSERT INTO Cliente(codigo, nome, pessoa, descricao)
VALUES(58974, 'Lucivalia Vieira', 'PF', 'uma ótimo clienta');

UPDATE Cliente SET descricao = 'um clienta muito bom' 
WHERE id = 101;

DELETE FROM Cliente WHERE id = 104;

SELECT * FROM Cliente;


INSERT INTO Produtos(codigo, nome, preco, descricao)
VALUES(11258, 'Café Santa Clara', 5.80, 'Produto de primeira');

SELECT * FROM Produtos;



INSERT INTO Pedido(codigo, dataSolicitacao, flagPago, totalPedido, idCliente)
VALUES(8947550, 2021/04/29, 10, 30, 104);

SELECT * FROM Pedido;


INSERT INTO PedidoItem(codigoProduto, preco, quantidade)
VALUES(11258, 5.8, 200);


SELECT * FROM PedidoItem;


--------------- Juções entre tabelas ---------------------

SELECT * FROM Cliente cli LEFT JOIN Pedido ped
ON cli.id = ped.id;

SELECT * FROM Cliente cli RIGHT JOIN Pedido ped
ON cli.id = ped.id;

SELECT * FROM Cliente cli INNER JOIN Pedido ped
ON cli.id = ped.id;
