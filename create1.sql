DROP TABLE IF EXISTS Loja;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Estado;
DROP TABLE IF EXISTS TermoEmprestimo;
DROP TABLE IF EXISTS Transacao;
DROP TABLE IF EXISTS Avaliacao;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Loja {
    idLoja  INTEGER 
            NOT NULL
            PRIMARY KEY,

    nome    NOT NULL,

   endereco TEXT,
   telefone TEXT,
    UNIQUE(nome, endereco, telefone);
};



CREATE TABLE Item {
   IdItem INTEGER 
        NOT NULL
        PRIMARY KEY,
   nome TEXT 
        NOT NULL,

   dataEntrada DATE,
    categoria TEXT,
    dimensoes  TEXT CHECK ((dimensoes > 0)),
    material TEXT,
    precoVenda REAL CHECK ((precoVenda > 0)),
    idLoja INTEGER,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja) ON DELETE CASCADE ON UPDATE CASCADE
};



CREATE TABLE Estado {
   idEstado INTEGER
            NOT NULL
            PRIMARY KEY,
   tipo TEXT 
        NOT NULL
        CHECK (tipo IN('penhorado', 'à venda', 'vendido', 'devolvido')),
   dataAtribuicaoEstado DATE DEFAULT CURRENT_DATE,
     idItem INTEGER NOT NULL,
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE
};

CREATE TABLE TermoEmprestimo {
    idEmprestimo INTEGER NOT NULL PRIMARY KEY,
    valorEmprestimo REAL NOT NULL CHECK ((valorEmprestimo  > 0)),
    valorDevolverComJuros REAL NOT NULLCHECK ((valorDevolverComJuros  > 0)) ,
    dataInicioEmprestimo DATE NOT NULL,
    dataLimitePagamento DATE NOT NULL,
    idItem INTEGER NOT NULL,
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE
};

CREATE TABLE Transacao {
    idItem INTEGER NOT NULL,
    nifCliente TEXT NOT NULL,
    tipo TEXT NOT NULL
            CHECK (tipo IN('compra', 'requisição de empréstimo', 'devolução de empréstimo')),
    valor REAL NOT NULL,
    dataTransacao DATE NOT NULL,
    metodoPagamento TEXT NOT NULL
                    CHECK (metodoPagamento IN('transferência bancária', 'dinheiro')),
    PRIMARY KEY{
        idItem,
        nifCliente

    }
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nifCliente) REFERENCES Cliente(nifCliente) ON DELETE CASCADE ON UPDATE CASCADE
};


CREATE TABLE Avaliacao {
    idAvaliacao INTEGER NOT NULL 
    idItem INTEGER NOT NULL,
    nifFuncionario TEXT NOT NULL,
    dataAvaliacao DATE NOT NULL,
    notasAvaliacao TEXT,
    valorAvaliado REAL
                    NOT NULL
                CHECK ((valorAvaliado > 0)),
    estadoConservacao TEXT NOT NULL
                        CHECK (estadoConservacao IN('muito usado', 'usado', 'semi-novo', 'novo')),
    PRIMARY KEY {
        idAvaliacao,
        idItem
    }
    FOREIGN KEY (idItem) REFERENCES Item(idItem) ON DELETE CASCADE ON UPDATE CASCADE
    FOREIGN KEY (nifFuncionario) REFERENCES Funcionario(nifFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
};


CREATE TABLE Funcionario {
   nifFuncionario INT NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    telefone TEXT,
    email TEXT,
    salario REAL
            NOT NULL
            CHECK ((salario > 0)),
    idLoja INTEGER,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja) ON DELETE CASCADE ON UPDATE CASCADE
    UNIQUE(nifFuncionario, telefone, email);
};

CREATE TABLE Cliente {
    nifCliente INT NOT NULL PRIMARY KEY,
    nome TEXT NOT NULL,
    telefone TEXT,
    email TEXT,
   UNIQUE(nifCliente, telefone, email);
};