-- Criação do banco de dados para oficina mecânica
CREATE DATABASE oficina_mecanica_db;
USE oficina_mecanica_db;

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

-- Tabela de Veículos
CREATE TABLE veiculos (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anoFabricacao YEAR NOT NULL,
    placa VARCHAR(8) UNIQUE NOT NULL,
    cor VARCHAR(30),
    quilometragem INT DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela de Mecânicos
CREATE TABLE mecanicos (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    data_contratacao DATE,
    salario DECIMAL(10, 2)
);

-- Tabela de Serviços
CREATE TABLE servicos (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_base DECIMAL(10, 2) NOT NULL,
    tempo_estimado_horas DECIMAL(5, 2)
);

-- Tabela de Ordens de Serviço
CREATE TABLE ordens_servico (
    id_ordem INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_mecanico INT,
    data_abertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_conclusao DATE,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_ordem ENUM('aberta', 'em andamento', 'concluida', 'cancelada') DEFAULT 'aberta',
    observacoes TEXT,
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico)
);

-- Tabela de Itens da Ordem de Serviço
CREATE TABLE itens_ordem (
    id_item_ordem INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(5, 2) DEFAULT 0.00,
    FOREIGN KEY (id_ordem) REFERENCES ordens_servico(id_ordem),
    FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);

-- Tabela de Peças
CREATE TABLE pecas (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    fornecedor VARCHAR(100),
    codigo_fabricante VARCHAR(50)
);

-- Tabela de Peças utilizadas nas Ordens de Serviço
CREATE TABLE pecas_ordem (
    id_peca_ordem INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_ordem) REFERENCES ordens_servico(id_ordem),
    FOREIGN KEY (id_peca) REFERENCES pecas(id_peca)
);

-- Inserção de dados de exemplo
INSERT INTO clientes (nome, email, cpf, telefone, data_nascimento, endereco, cidade, estado, cep) VALUES
('João Silva', 'joao@email.com', '123.456.789-00', '(11) 99999-9999', '1990-05-15', 'Rua A, 123', 'São Paulo', 'SP', '01234-567'),
('Maria Santos', 'maria@email.com', '987.654.321-00', '(21) 98888-8888', '1985-10-20', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '12345-678');

INSERT INTO veiculos (id_cliente, marca, modelo, anoFabricacao, placa, cor, quilometragem) VALUES
(1, 'Volkswagen', 'Gol', 2018, 'ABC-1234', 'Prata', 45000),
(2, 'Chevrolet', 'Onix', 2020, 'XYZ-9876', 'Branco', 32000);

INSERT INTO mecanicos (nome, especialidade, cpf, telefone, data_contratacao, salario) VALUES
('Carlos Oliveira', 'Motor', '111.222.333-44', '(11) 77777-7777', '2020-01-15', 3500.00),
('Ana Costa', 'Elétrica', '555.666.777-88', '(21) 66666-6666', '2019-03-20', 3200.00);

INSERT INTO servicos (nome_servico, descricao, preco_base, tempo_estimado_horas) VALUES
('Troca de Óleo', 'Troca de óleo e filtro', 80.00, 1.0),
('Alinhamento', 'Alinhamento das rodas', 120.00, 2.0),
('Balanceamento', 'Balanceamento das rodas', 100.00, 1.5),
('Revisão Completa', 'Revisão completa do veículo', 300.00, 4.0);

INSERT INTO ordens_servico (id_veiculo, id_mecanico, valor_total, status_ordem, observacoes) VALUES
(1, 1, 200.00, 'concluida', 'Troca de óleo e filtro'),
(2, 2, 420.00, 'em andamento', 'Alinhamento e balanceamento');

INSERT INTO itens_ordem (id_ordem, id_servico, quantidade, preco_unitario) VALUES
(1, 1, 1, 80.00),
(1, 2, 1, 120.00),
(2, 3, 1, 100.00),
(2, 4, 1, 300.00);

INSERT INTO pecas (nome_peca, descricao, preco, estoque, fornecedor, codigo_fabricante) VALUES
('Filtro de Óleo', 'Filtro de óleo modelo X', 45.00, 20, 'AutoPeças LTDA', 'FO-001'),
('Óleo Motor', 'Óleo sintético 5W30', 60.00, 30, 'Lubrax', 'OM-001'),
('Amortecedor Dianteiro', 'Amortecedor dianteiro para Gol', 350.00, 10, 'Suspensys', 'AD-001');

INSERT INTO pecas_ordem (id_ordem, id_peca, quantidade, preco_unitario) VALUES
(1, 1, 1, 45.00),
(1, 2, 1, 60.00);