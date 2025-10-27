-- ===============================================================
-- 1) Criação da tabela de Fornecedores
-- ===============================================================
CREATE TABLE Fornecedores (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

-- ===============================================================
-- 2) Criação da tabela de Colaboradores
-- ===============================================================
CREATE TABLE Colaboradores (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    dataContratacao DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

-- ===============================================================
-- 3) Criação da tabela de Produtos
-- ===============================================================
CREATE TABLE Produtos (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL, -- 10 dígitos no total, 2 casas decimais
    categoria VARCHAR(50)
);

-- ===============================================================
-- 4) Criação da tabela de Clientes
-- ===============================================================
CREATE TABLE Clientes (
    id TEXT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) DEFAULT 'Sem email',
    endereco TEXT NOT NULL
);

-- ===============================================================
-- 5) Criação da tabela de Pedidos
-- ===============================================================
CREATE TABLE Pedidos (
    id TEXT PRIMARY KEY,
    idCliente TEXT NOT NULL,
    idColaborador TEXT,
    dataPedido DATE NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (idCliente) REFERENCES Clientes(id),
    FOREIGN KEY (idColaborador) REFERENCES Colaboradores(id)
);

-- ===============================================================
-- 6) Criação da tabela de Itens do Pedido
-- ===============================================================
CREATE TABLE ItensPedido (
    idPedido TEXT,
    idProduto TEXT,
    quantidade INTEGER NOT NULL,
    precoUnitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES Produtos(id) ON DELETE CASCADE
);
