DELIMITER //
-- Trigger para atualizar o salário do funcionário quando uma consulta é adicionada
CREATE TRIGGER AtualizaSalarioAposConsulta
AFTER INSERT ON Consulta
FOR EACH ROW
BEGIN
    UPDATE Funcionario
    SET Salario = Salario + 100
    WHERE ID_Funcionario = NEW.ID_Medico;
END;

-- Trigger para garantir que o telefone do paciente seja único
CREATE TRIGGER AtualizaSalarioAposConsulta
AFTER INSERT ON Consulta
FOR EACH ROW
BEGIN
    UPDATE Funcionario
    SET Salario = Salario + 100
    WHERE ID_Funcionario = NEW.ID_Medico;
END;

-- Trigger para verificar idade mínima de 18 anos ao inserir um paciente
CREATE TRIGGER VerificaIdadeMinimaPaciente
BEFORE INSERT ON Paciente
FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.Data_Nascimento, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente deve ter no mínimo 18 anos.';
    END IF;
END;

-- Trigger para manter um log de atualizações de salário dos funcionários
CREATE TRIGGER LogAtualizacaoSalario
AFTER UPDATE ON Funcionario
FOR EACH ROW
BEGIN
    IF OLD.Salario <> NEW.Salario THEN
        INSERT INTO LogSalario (ID_Funcionario, SalarioAntigo, SalarioNovo, DataAlteracao)
        VALUES (OLD.ID_Funcionario, OLD.Salario, NEW.Salario, NOW());
    END IF;
END;
//
DELIMITER ;
