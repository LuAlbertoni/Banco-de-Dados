-- View para mostrar todos as consultas de 2024
CREATE VIEW Consultas2024 AS
SELECT 
    C.ID_Consulta,
    P.Nome AS Nome_Paciente,
    P.Data_Nascimento,
    P.Sexo,
    P.Endereco,
    M.Nome AS Nome_Medico,
    M.Especialidade,
    E.Nome AS Nome_Enfermeiro,
    C.Observacoes,
    C.Data_Consulta
FROM Consulta C
JOIN Paciente P ON C.ID_Paciente = P.ID_Paciente
JOIN Medico M ON C.ID_Medico = M.ID_Medico
JOIN Enfermeiro E ON C.ID_Enfermeiro = E.ID_Enfermeiro
WHERE YEAR(C.Data_Consulta) = 2024;

-- View para listar pacientes por sexo
CREATE VIEW PacientesPorSexo AS
SELECT 
    Sexo,
    COUNT(*) AS Total
FROM Paciente
GROUP BY Sexo;
 
-- View para listar enfermeiros com detalhes do departamento
CREATE VIEW DetalhesEnfermeiro AS
SELECT 
    E.ID_Enfermeiro,
    E.Nome AS Nome_Enfermeiro,
    E.Coren,
    E.Telefone AS Telefone_Enfermeiro,
    E.Email AS Email_Enfermeiro,
    F.Nome AS Nome_Departamento,
    F.Cargo,
    F.Salario,
    F.Data_Admissao
FROM Enfermeiro E
JOIN Funcionario F ON E.Funcionario_ID = F.ID_Funcionario;

-- View para listar consultas com detalhes de pacientes e médicos
CREATE VIEW ConsultasDetalhadas AS
SELECT 
    C.ID_Consulta,
    P.Nome AS Nome_Paciente,
    P.Data_Nascimento,
    P.Sexo,
    P.Endereco,
    M.Nome AS Nome_Medico,
    M.Especialidade,
    E.Nome AS Nome_Enfermeiro,
    C.Observacoes
FROM Consulta C
JOIN Paciente P ON C.ID_Paciente = P.ID_Paciente
JOIN Medico M ON C.ID_Medico = M.ID_Medico
JOIN Enfermeiro E ON C.ID_Enfermeiro = E.ID_Enfermeiro;

-- View para listar detalhes completos dos médicos
CREATE VIEW DetalhesMedico AS
SELECT 
    M.ID_Medico,
    M.Nome AS Nome_Medico,
    M.Especialidade,
    M.CRM,
    M.Telefone AS Telefone_Medico,
    M.Email AS Email_Medico,
    F.Nome AS Nome_Departamento,
    F.Cargo,
    F.Salario,
    F.Data_Admissao
FROM Medico M
JOIN Funcionario F ON M.Funcionario_ID = F.ID_Funcionario;
