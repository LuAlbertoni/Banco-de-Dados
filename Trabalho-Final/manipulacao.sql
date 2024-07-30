-- Tabela Paciente
INSERT INTO Paciente (ID_Paciente, Nome, Data_Nascimento, Sexo, Endereco, Telefone, Email)
    VALUES (1, "João Silva", "1980-05-15", "M", "Rua A, 123", "1111-1111", "joao.silva@protonmail.com"), 
           (2, "Maria Oliveira", "1990-07-20", "F", "Rua B, 456", "2222-2222", "maria.oliveira@protonmail.com"), 
           (3, "Carlos Pereira", "1975-09-30", "M", "Rua C, 789", "3333-3333", "carlos.pereira@protonmail.com"), 
           (4, "Ana Souza", "1985-02-25", "F", "Rua D, 101", "4444-4444", "ana.souza@protonmail.com");

-- Tabela Departamento
INSERT INTO Departamento (ID_Departamento, Nome, Localizacao)
    VALUES (1, "Cardiologia", "Andar 1"), 
           (2, "Neurologia", "Andar 2"), 
           (3, "Ortopedia", "Andar 3"), 
           (4, "Pediatria", "Andar 4");

-- Tabela Funcionario
INSERT INTO Funcionario (ID_Funcionario, Nome, Cargo, Departamento_ID, Salario, Data_Admissao)
    VALUES (1, "Pedro Lima", "Medico", 1, 12000, "2015-03-15"), 
           (2, "Lucas Almeida", "Enfermeiro", 2, 5000, "2017-06-20"), 
           (3, "Juliana Costa", "Medico", 3, 11000, "2016-09-01"), 
           (4, "Fernanda Ribeiro", "Enfermeiro", 4, 5500, "2018-11-11");

-- Tabela Medico
INSERT INTO Medico (ID_Medico, Nome, Especialidade, CRM, Telefone, Email, Funcionario_ID)
    VALUES (1, "Pedro Lima", "Cardiologista", "12345", "5555-5555", "pedro.lima@protonmail.com", 1), 
           (2, "Juliana Costa", "Ortopedista", "67890", "6666-6666", "juliana.costa@protonmail.com", 3);

-- Tabela Enfermeiro
INSERT INTO Enfermeiro (ID_Enfermeiro, Nome, Coren, Telefone, Email, Funcionario_ID)
    VALUES (1, "Lucas Almeida", "98765", "7777-7777", "lucas.almeida@protonmail.com", 2), 
           (2, "Fernanda Ribeiro", "54321", "8888-8888", "fernanda.ribeiro@protonmail.com", 4);

-- Tabela Consulta
INSERT INTO Consulta (ID_Consulta, ID_Paciente, ID_Medico, ID_Enfermeiro, Observacoes)
    VALUES (1, 1, 1, 1, "Consulta de rotina"), 
           (2, 2, 2, 2, "Consulta pós-operatória");

-- Tabela Consulta_Data
INSERT INTO Consulta_Data (ID_Consulta, Data_Consulta)
    VALUES (1, "2024-05-15"), 
           (2, "2024-06-20");

-- Tabela Internacao
INSERT INTO Internacao (ID_Internacao, ID_Paciente, ID_Enfermeiro, Data_Admissao, Data_Alta, Motivo, Observacoes)
    VALUES (1, 3, 1, "2024-01-10", "2024-01-20", "Cirurgia de joelho", "Recuperação tranquila"), 
           (2, 4, 2, "2024-03-15", "2024-03-25", "Pneumonia", "Melhora significativa");

-- Tabela Medicamento
INSERT INTO Medicamento (ID_Medicamento, Nome, Fabricante, Quantidade_Estoque, Preco_Unitario)
    VALUES (1, "Paracetamol", "MedPharma", 100, 1.5), 
           (2, "Ibuprofeno", "HealthCorp", 200, 2), 
           (3, "Amoxicilina", "PharmaLife", 150, 3), 
           (4, "Omeprazol", "GoodMeds", 250, 2.5);

-- Tabela Prescricao
INSERT INTO Prescricao (ID_Prescricao, ID_Consulta, ID_Medicamento, Quantidade, Instrucoes)
    VALUES (1, 1, 1, 2, "Tomar 1 comprimido a cada 8 horas"), 
           (2, 2, 2, 3, "Tomar 1 comprimido a cada 12 horas");

-- Tabela Exame
INSERT INTO Exame (ID_Exame, ID_Paciente, Tipo_Exame, Data_Exame, Resultado)
    VALUES (1, 1, "Hemograma", "2024-04-15", "Normal"), 
           (2, 2, "Raio-X", "2024-05-20", "Fratura confirmada");

-- Tabela Cirurgia
INSERT INTO Cirurgia (ID_Cirurgia, ID_Paciente, ID_Medico, Data_Cirurgia, Tipo_Cirurgia, Observacoes)
    VALUES (1, 3, 2, "2024-02-10", "Cirurgia de joelho", "Sucesso sem complicações"), 
           (2, 4, 1, "2024-04-20", "Cirurgia cardíaca", "Paciente em recuperação");

-- Tabela Historico_Saude
INSERT INTO Historico_Saude (ID_Registro, ID_Paciente, Data_Registro, Tipo_Registro, Descricao)
    VALUES (1, 1, "2024-03-01", "Consulta", "Check-up anual"), 
           (2, 2, "2024-04-01", "Internação", "Tratamento de pneumonia");

-- Atualizar dados
UPDATE Paciente
    SET Telefone = "9999-9999"
    WHERE ID_Paciente = 1;

-- Excluir registros
DELETE FROM Medicamento
    WHERE ID_Medicamento = 4;

-- Inserir novos dados
INSERT INTO Paciente (ID_Paciente, Nome, Data_Nascimento, Sexo, Endereco, Telefone, Email)
    VALUES (5, "Lucas Martins", "1995-12-12", "M", "Rua E, 222", "5555-5555", "lucas.martins@protonmail.com");

-- Consultar dados
SELECT * FROM Paciente;
SELECT * FROM Medicamento;
SELECT * FROM Internacao
    WHERE ID_Paciente = 4;

-- Realizar junção de tabelas para exibir informações de consultas
SELECT c.ID_Consulta, p.Nome AS Nome_Paciente, m.Nome AS Nome_Medico, c.Observacoes
    FROM Consulta c
    JOIN Paciente p ON c.ID_Paciente = p.ID_Paciente
    JOIN Medico m ON c.ID_Medico = m.ID_Medico;

-- Atualizar salário de um funcionário
UPDATE Funcionario
    SET Salario = 6000
    WHERE ID_Funcionario = 2;
