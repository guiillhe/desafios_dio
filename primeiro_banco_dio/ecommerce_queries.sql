-- Criação do banco de dados para e-commerce
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Tabela de Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    data_nascimento DATE,
    endereco VARCHAR(200),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(9),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Categorias de Produtos
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    id_categoria INT,
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_pedido ENUM('pendente', 'confirmado', 'em separacao', 'enviado', 'entregue', 'cancelado') DEFAULT 'pendente',
    endereco_entrega VARCHAR(200),
    cidade_entrega VARCHAR(50),
    estado_entrega VARCHAR(2),
    cep_entrega VARCHAR(9),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    id_item_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserção de categorias padrão
INSERT INTO categorias (nome_categoria, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos em geral'),
('Vestuário', 'Roupas e acessórios'),
('Livros', 'Livros de diversos gêneros'),
('Esportes', 'Artigos esportivos'),
('Casa e Decoração', 'Produtos para casa e decoração');

-- Inserção de alguns produtos de exemplo
INSERT INTO produtos (nome_produto, descricao, preco, estoque, id_categoria) VALUES
('Smartphone XYZ', 'Smartphone com 128GB de armazenamento', 1299.90, 50, 1),
('Camiseta Básica', 'Camiseta 100% algodão, várias cores', 49.90, 100, 2),
('Livro de Programação', 'Livro completo sobre programação web', 89.90, 30, 3),
('Bola de Futebol', 'Bola oficial de campo', 79.90, 25, 4),
('Luminária LED', 'Luminária de mesa com controle de brilho', 129.90, 20, 5);

-- Inserção de clientes de exemplo
INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, endereco, cidade, estado, cep) VALUES
('João Silva', 'joao@email.com', '123.456.789-00', '(11) 99999-9999', '1990-05-15', 'Rua A, 123', 'São Paulo', 'SP', '01234-567'),
('Maria Santos', 'maria@email.com', '987.654.321-00', '(21) 98888-8888', '1985-10-20', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '12345-678');

-- Inserção de pedidos de exemplo
INSERT INTO pedidos (id_cliente, valor_total, status_pedido, endereco_entrega, cidade_entrega, estado_entrega, cep_entrega) VALUES
(1, 1349.80, 'confirmado', 'Rua A, 123', 'São Paulo', 'SP', '01234-567'),
(2, 129.90, 'enviado', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '12345-678');

-- Inserção de itens do pedido de exemplo
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1299.90),
(1, 2, 1, 49.90),
(2, 5, 1, 129.90);