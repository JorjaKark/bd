DROP TABLE IF EXISTS Avaliacao;
DROP TABLE IF EXISTS Transacao;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS TermoEmprestimo;
DROP TABLE IF EXISTS Estado;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Loja;

--esta tabela nao tem referências
CREATE TABLE Loja (
    idLoja INTEGER NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    endereco TEXT NOT NULL UNIQUE,
    telefone TEXT NOT NULL UNIQUE
);

--esta tabela referencia: loja
CREATE TABLE Item (
    idItem INTEGER NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    dataEntrada DATE,
    categoria TEXT,
    dimensoes Text NOT NULL,
    material TEXT,
    precoVenda REAL CHECK (( precoVenda IS NULL OR precoVenda > 0 )), -- pode ser NULL quando não está 'à venda'
    idLoja INTEGER,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja) ON DELETE CASCADE ON UPDATE CASCADE
);

--esta tabela referencia: Item
CREATE TABLE Estado (
    idEstado INTEGER NOT NULL PRIMARY KEY,
    tipo TEXT NOT NULL CHECK (tipo IN ('penhorado', 'à venda', 'vendido', 'devolvido')),
    dataAtribuicaoEstado DATE DEFAULT CURRENT_DATE,
    idItem INTEGER NOT NULL,
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE
);

-- esta tabela referencia: item
CREATE TABLE TermoEmprestimo (
    idEmprestimo INTEGER NOT NULL PRIMARY KEY,
    valorEmprestimo REAL NOT NULL CHECK (valorEmprestimo > 0),
    valorDevolverComJuros REAL NOT NULL,
    dataInicioEmprestimo DATE NOT NULL,
    dataLimitePagamento DATE NOT NULL,
    idItem INTEGER NOT NULL UNIQUE, --um item pode ter apenas um termo de empréstimo ativo
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT check_datas CHECK (dataLimitePagamento > dataInicioEmprestimo),
    --constraint:garantir que o valor com juros é 110% do valor do empréstimo
    --(a taxa a ser aplicada é sempre de 10% do valor do empréstimo)
    CONSTRAINT check_juros CHECK ((valorDevolverComJuros - (valorEmprestimo * 1.10)) >= -0.01 AND
                                    (valorDevolverComJuros - (valorEmprestimo * 1.10)) <= 0.01)
);

--esta tabela nao tem referencias
CREATE TABLE Pessoa (
    nif TEXT NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    email TEXT NOT NULL,
    CONSTRAINT unique_nif_telefone_email_pessoa UNIQUE (nif, telefone, email)
);

--  esta tabela  nao tem referencias
CREATE TABLE Cliente (
    nifCliente TEXT NOT NULL PRIMARY KEY,
    FOREIGN KEY (nifCliente) REFERENCES Pessoa(nif) ON DELETE CASCADE ON UPDATE CASCADE
);


-- esta tabela referencia: Loja
CREATE TABLE Funcionario (
    nifFuncionario TEXT NOT NULL PRIMARY KEY,
    salario REAL NOT NULL CHECK (salario > 0),
    idLoja INTEGER NOT NULL,
    FOREIGN KEY (nifFuncionario) REFERENCES Pessoa(nif) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja) ON DELETE CASCADE ON UPDATE CASCADE
);


-- esta tabela referencia: item, cliente
CREATE TABLE Transacao (
    idTransacao INTEGER NOT NULL,
    idItem INTEGER NOT NULL,
    nifCliente TEXT NOT NULL,
    tipo TEXT NOT NULL CHECK (tipo IN ('compra', 'requisição de empréstimo', 'devolução de empréstimo')),
    valor REAL NOT NULL,
    dataTransacao DATE NOT NULL,
    metodoPagamento TEXT NOT NULL CHECK (metodoPagamento IN ('transferência bancária', 'dinheiro')),
    PRIMARY KEY (idTransacao, idItem),
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nifCliente) REFERENCES Cliente(nifCliente) ON DELETE CASCADE ON UPDATE CASCADE
);


--esta tabela referencia: item,funcionario
CREATE TABLE Avaliacao (
    idAvaliacao INTEGER NOT NULL,
    idItem INTEGER NOT NULL,
    nifFuncionario TEXT NOT NULL,
    dataAvaliacao DATE NOT NULL,
    notasAvaliacao TEXT,
    valorAvaliado REAL NOT NULL CHECK (valorAvaliado > 0),
    estadoConservacao TEXT NOT NULL CHECK (estadoConservacao IN ('muito usado', 'usado', 'semi-novo', 'novo')),
    PRIMARY KEY (idAvaliacao, idItem),
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nifFuncionario) REFERENCES Funcionario(nifFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
);

