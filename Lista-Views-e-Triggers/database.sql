-- Criação do banco de dados
CREATE DATABASE fatec_vendas;
USE fatec_vendas;

-- Criação das tabelas
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    estoque INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    categoria INT,
    FOREIGN KEY (categoria) REFERENCES categorias(id)
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    numero_nota VARCHAR(50),
    data_venda DATE,
    total_venda DECIMAL(10, 2)
);

CREATE TABLE itens_vendas (
    venda_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (venda_id, produto_id),
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(20),
    status VARCHAR(20)
);

CREATE TABLE auditoria_precos (
    produto_id INT,
    preco_anterior DECIMAL(10, 2),
    novo_preco DECIMAL(10, 2),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Criação das Views

-- 01. View vendas_2023
CREATE VIEW vendas_2023 AS
    SELECT * FROM vendas
    WHERE YEAR(data_venda) = 2023;

-- 02. View produtos_disponiveis
CREATE VIEW produtos_disponiveis AS
    SELECT * FROM produtos
    WHERE estoque > 0;

-- 03. View top_clientes
CREATE VIEW top_clientes AS
    SELECT c.id, c.nome, SUM(v.total_venda) AS total_compras
    FROM clientes c
    JOIN vendas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nome
    ORDER BY total_compras DESC;

-- 04. View vendas_recentes
CREATE VIEW vendas_recentes AS
    SELECT * FROM vendas
    WHERE data_venda >= CURDATE() - INTERVAL 30 DAY;

-- 05. View clientes_ativos
CREATE VIEW clientes_ativos AS
    SELECT * FROM clientes
    WHERE status = "ativo";

-- Criação dos Triggers

-- 06. Trigger para atualizar estoque após venda
DELIMITER //
CREATE TRIGGER atualiza_estoque_venda
    AFTER INSERT ON itens_vendas
    FOR EACH ROW
    BEGIN
        UPDATE produtos
        SET estoque = estoque - NEW.quantidade
        WHERE id = NEW.produto_id;
    END; //
DELIMITER ;

-- 07. Trigger para impedir exclusão de cliente com vendas
DELIMITER //
CREATE TRIGGER impede_exclusao_cliente
    BEFORE DELETE ON clientes
    FOR EACH ROW
    BEGIN
        IF (SELECT COUNT(*) FROM vendas WHERE cliente_id = OLD.id) > 0 THEN
            SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Cliente possui vendas registradas e não pode ser excluído.";
        END IF;
    END; //
DELIMITER ;

-- 08. Trigger para registrar alteração de preço
DELIMITER //
CREATE TRIGGER auditoria_precos_produtos
    AFTER UPDATE ON produtos
    FOR EACH ROW
    BEGIN
        IF OLD.preco_unitario != NEW.preco_unitario THEN
            INSERT INTO auditoria_precos (produto_id, preco_anterior, novo_preco)
            VALUES (OLD.id, OLD.preco_unitario, NEW.preco_unitario);
        END IF;
    END; //
DELIMITER ;

-- 09. Trigger para atualizar status do cliente após venda
DELIMITER //
CREATE TRIGGER atualiza_status_cliente
    AFTER INSERT ON vendas
    FOR EACH ROW
    BEGIN
        UPDATE clientes
        SET status = "ativo"
        WHERE id = NEW.cliente_id AND status = "inativo";
    END; //
DELIMITER ;

-- 10. Trigger para atribuir categoria "Outros" após exclusão de categoria
DELIMITER //
CREATE TRIGGER categoria_outros
    AFTER DELETE ON categorias
    FOR EACH ROW
    BEGIN
        UPDATE produtos
        SET categoria = (SELECT id FROM categorias WHERE categoria = "Outros")
        WHERE categoria = OLD.id;
    END; // 
DELIMITER ;

-- Inserindo a categoria "Outros" na tabela categorias para garantir que ela exista
INSERT INTO categorias (categoria) VALUES ("Outros");