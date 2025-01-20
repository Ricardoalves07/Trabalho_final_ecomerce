-- Configurando o encoding para aceitar caracteres brasileiros
SET client_encoding = 'UTF8';

-- Tabela Usuario
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    email VARCHAR(100) UNIQUE NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    administrador BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabela Categoria
CREATE TABLE Categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    foto TEXT,
    quantidade INT NOT NULL CHECK (quantidade >= 0),
    categoria_id INT NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES Categoria (id) ON DELETE CASCADE
);

-- Tabela Venda
CREATE TABLE Venda (
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES Usuario (id) ON DELETE CASCADE
);

-- Relacionamento entre Venda e Produto (Possui)
CREATE TABLE Venda_Produto (
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    PRIMARY KEY (venda_id, produto_id),
    CONSTRAINT fk_venda FOREIGN KEY (venda_id) REFERENCES Venda (id) ON DELETE CASCADE,
    CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES Produto (id) ON DELETE CASCADE
);

-- Tabela Carrinho
CREATE TABLE Carrinho (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    CONSTRAINT fk_usuario_carrinho FOREIGN KEY (usuario_id) REFERENCES Usuario (id) ON DELETE CASCADE,
    CONSTRAINT fk_produto_carrinho FOREIGN KEY (produto_id) REFERENCES Produto (id) ON DELETE CASCADE
);
