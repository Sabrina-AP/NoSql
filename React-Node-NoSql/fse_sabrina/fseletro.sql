CREATE SCHEMA `fseletro`;
USE `fseletro`;
  CREATE TABLE `fseletro`.`produto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `categorias` varchar(45) NOT NULL,
  `nome_produto` varchar(45) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `preco_anterior` decimal(8,2) NOT NULL,
  `preco_atual` decimal(8,2) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idproduto`))
  ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM fseletro.produto;
INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Geladeiras', 'Geladeira Side', 'Geladeira Frost Free Brastemp Side Inverse 540 litros', 6389.00, 5019.00, 'geladeira_side.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Geladeiras', 'Geladeira Branca', 'Geladeira Frost Free Brastemp Branca 375 litros', 2068.60, 1910.90, 'geladeira_branca.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Geladeiras', 'Geladeira Prata', 'Geladeira Frost Free Consul Prata 340 litros', 2199.90, 2069.00, 'geladeira_prata.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Fogões', 'Fogão Consul', 'Fogão 4 Bocas Consul Inox com Mesa de Vidro', 1209.90, 1129.00, 'fogao_consul.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Fogões', 'Fogão Atlas', 'Fogão de Piso 4 Bocas Atlas Monaco com Acendimento Automático', 609.90, 519.70, 'fogao_atlas.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Micro-ondas', 'Micro-ondas Consul', 'Micro-ondas Consul 32 Litros Inox 220V', 580.90, 409.88, 'microondas_consul.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Micro-ondas', 'Micro-ondas Philco', 'Microondas 25L Espelhado Philco 220V', 508.70, 464.53,'microondas_philco.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Micro-ondas', 'Micro-ondas Eletrolux', 'Forno de Microondas Eletrolux 20L Branco', 459.90, 436.05, 'microondas_eletrolux.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Lava-louças', 'Lava-louça Eletrolux', 'Lava-Louça Eletrolux Inox com 10 Serviços, 06 Programas de Lavagem e Painel Blue Touch', 3599.00, 2799.90, 'lavalouca_eletrolux.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Lava-louças', 'Lava-louça Brastemp', 'Lava Louça Compacta 8 Serviços Branca 127V Brastemp', 1970.50, 1730.61, 'lavalouca_brastemp.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Lavadoras', 'Máquina Brastemp', 'Lavadora de Roupas Brastemp 11 kg com Turbo Performance Branca', 1699.00, 1214.10, 'maquina_brastemp.jpg');

INSERT INTO `fseletro`.`produto`(`categorias`, `nome_produto`, `descricao`, `preco_anterior`, `preco_atual`, `imagem`)
VALUES ('Lavadoras', 'Máquina Philco', 'Lavadora de Roupas Philco Inverter 12KG', 2399.90, 2179.90, 'maquina_philco.jpg');

CREATE TABLE `fseletro`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `cliente` VARCHAR(150) NOT NULL,
  `endereço` VARCHAR(250) NOT NULL,
  `telefone` TEXT(17) NOT NULL,
  PRIMARY KEY (`idcliente`))
COMMENT = 'dados do cliente'
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fseletro`.`pedidos` (
  `idpedidos` int NOT NULL AUTO_INCREMENT,
  `clientep` varchar(150) NOT NULL,
  `nome_produto` varchar(45) NOT NULL,
  `valor_unitario` decimal(8,2) NOT NULL,
  `quantidade` int NOT NULL,
  `valor_total` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idpedidos`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fseletro`.`pedido_cliente` (
  `id_cliente` INT NOT NULL,
  `id_pedidos` INT NOT NULL,
  PRIMARY KEY (`id_pedidos`, `id_cliente`))
COMMENT = 'Pedidos dos clientes especificos'
ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `fseletro`.`pedido_cliente` 
ADD CONSTRAINT `fkc`
  FOREIGN KEY (`id_cliente`)
  REFERENCES `fseletro`.`cliente` (`idcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fkp`
  FOREIGN KEY (`id_pedidos`)
  REFERENCES `fseletro`.`pedidos` (`idpedidos`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

SELECT * FROM fseletro.cliente;
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa A', 'Rua A', '(11) 9999-9999');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa B', 'Rua B', '(11) 8888-8888');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa C', 'Rua C', '(11) 7777-7777');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa D', 'Rua D', '(11) 6666-6666');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa E', 'Rua E', '(11) 5555-5555');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa F', 'Rua F', '(11) 4444-4444');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa G', 'Rua G', '(11) 3333-3333');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa H', 'Rua H', '(11) 2222-2222');
INSERT INTO `fseletro_bianca`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa I', 'Rua I', '(11) 1111-1111');
INSERT INTO `fseletro`.`cliente` (`cliente`, `endereço`, `telefone`)
VALUES ('Pessoa J', 'Rua J', '(11) 0000-0000');


SELECT * FROM fseletro.pedidos;
INSERT INTO `fseletro`.`pedidos` (`clientep`, `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa A', 'Geladeira Side', 5019.00, 1, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa A', 'Fogão Consul', 1129.00, 3, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa C', 'Máquina Brastemp', 1214.10, 1, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa G', 'Fogão Atlas', 519.70, 2, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa C', 'Fogão Atlas', 519.70, 3, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa G', 'Máquina Philco', 2179.90, 2, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa E', 'Geladeira Branca', 1910.90, 2, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa I', 'Micro-ondas Philco', 464.53, 2, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa H', 'Micro-ondas Consul', 409.88, 5, `valor_unitario` * `quantidade`);
INSERT INTO `fseletro`.`pedidos` (`clientep`,  `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`)
VALUES ('Pessoa G', 'Micro-ondas Eletrolux', 436.05, 4, `valor_unitario` * `quantidade`);

SELECT * FROM fseletro.pedido_cliente;
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (1, 1);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (1, 2);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (3, 3);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (7, 4);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (3, 5);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (7, 6);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (5, 7);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (9, 8);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (8, 9);
INSERT INTO `fseletro`.`pedido_cliente` (`id_cliente`, `id_pedidos`)
VALUES (7, 10);

CREATE TABLE `fseletro`.`comentario` (
  `idcoment` int AUTO_INCREMENT,
  `nome` varchar(100),
  `mensagem` varchar(300),
  `data` datetime default now(),  
  PRIMARY KEY (`idcoment`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;
SELECT * FROM fseletro.comentario;
INSERT INTO `fseletro`.`comentario` (`nome`, `mensagem`)
VALUES ('Pessoa A', 'Parabéns! Gostei muito dos produtos que comprei!');
INSERT INTO `fseletro`.`comentario` (`nome`, `mensagem`)
VALUES ('Pessoa D', 'Ótima loja! Já comprei diversos produtos!');


CREATE VIEW cp AS SELECT * FROM cliente inner join pedidos on clientep=cliente order by idpedidos desc;


