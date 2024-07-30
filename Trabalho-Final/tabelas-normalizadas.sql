CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Paciente (
    ID_Paciente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Data_Nascimento DATE,
    Sexo CHAR(1),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Nome VARCHAR(100),
    Localizacao VARCHAR(100)
);

CREATE TABLE Funcionario (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Departamento_ID INT,
    Salario DECIMAL(10, 2),
    Data_Admissao DATE,
    FOREIGN KEY (Departamento_ID) REFERENCES
    Departamento(ID_Departamento)
);

CREATE TABLE Medico (
    ID_Medico INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100),
    CRM VARCHAR(20),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Funcionario_ID INT,
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Enfermeiro (
    ID_Enfermeiro INT PRIMARY KEY,
    Nome VARCHAR(100),
    Coren VARCHAR(20),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Funcionario_ID INT,
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Consulta (
    ID_Consulta INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Medico INT,
    ID_Enfermeiro INT,
    Observacoes TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico),
    FOREIGN KEY (ID_Enfermeiro) REFERENCES Enfermeiro(ID_Enfermeiro)
);

CREATE TABLE Consulta_Data (
    ID_Consulta INT PRIMARY KEY,
    Data_Consulta DATE,
    FOREIGN KEY (ID_Consulta) REFERENCES Consulta(ID_Consulta)
);

CREATE TABLE Internacao (
    ID_Internacao INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Enfermeiro INT,
    Data_Admissao DATE,
    Data_Alta DATE,
    Motivo VARCHAR(255),
    Observacoes TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Enfermeiro) REFERENCES Enfermeiro(ID_Enfermeiro)
);

CREATE TABLE Medicamento (
    ID_Medicamento INT PRIMARY KEY,
    Nome VARCHAR(100),
    Fabricante VARCHAR(100),
    Quantidade_Estoque INT,
    Preco_Unitario DECIMAL(10, 2)
);

CREATE TABLE Prescricao (
    ID_Prescricao INT PRIMARY KEY,
    ID_Consulta INT,
    ID_Medicamento INT,
    Quantidade INT,
    Instrucao TEXT,
    FOREIGN KEY (ID_Consulta) REFERENCES Consulta(ID_Consulta),
    FOREIGN KEY (ID_Medicamento) REFERENCES
    Medicamento(ID_Medicamento)
);

CREATE TABLE Exame (
    ID_Exame INT PRIMARY KEY,
    ID_Paciente INT,
    Tipo_Exame VARCHAR(100),
    Data_Exame DATE,
    Resultado TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente)
);

CREATE TABLE Cirurgia (
    ID_Cirurgia INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Medico INT,
    Data_Cirurgia DATE,
    Tipo_Cirurgia VARCHAR(100),
    Observacoes TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico)
);

CREATE TABLE Historico_Saude (
    ID_Registro INT PRIMARY KEY,
    ID_Paciente INT,
    Data_Registro DATE,
    Tipo_Registro VARCHAR(100),
    Descricao TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente)
);