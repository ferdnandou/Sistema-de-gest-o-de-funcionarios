-- 1. Criar o Banco de Dados
CREATE DATABASE GestaoFuncionarios;
USE GestaoFuncionarios;

-- 2. Criar as Tabelas

-- Tabela Departamentos
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Tabela Funcionarios
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

-- Tabela Salarios
CREATE TABLE Salarios (
    id_salario INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    data DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

-- 3. Inserir Dados
INSERT INTO Departamentos (nome) VALUES ('Recursos Humanos'), ('TI'), ('Financeiro');

INSERT INTO Funcionarios (nome, cargo, salario, id_departamento) 
VALUES 
('Alice', 'Analista', 3000.00, 1),
('Bob', 'Desenvolvedor', 4000.00, 2),
('Carlos', 'Contador', 3500.00, 3);

INSERT INTO Salarios (id_funcionario, data, valor) 
VALUES 
(1, '2024-01-01', 3000.00),
(2, '2024-01-01', 4000.00),
(3, '2024-01-01', 3500.00);

-- 4. Consultas

-- Listar todos os funcionários e seus respectivos departamentos
SELECT Funcionarios.nome, Funcionarios.cargo, Departamentos.nome AS departamento
FROM Funcionarios
JOIN Departamentos ON Funcionarios.id_departamento = Departamentos.id_departamento;

-- Mostrar o salário total de cada departamento
SELECT Departamentos.nome AS departamento, SUM(Funcionarios.salario) AS total_salario
FROM Funcionarios
JOIN Departamentos ON Funcionarios.id_departamento = Departamentos.id_departamento
GROUP BY Departamentos.nome;

-- Verificar os salários históricos de um funcionário específico
SELECT Funcionarios.nome, Salarios.data, Salarios.valor
FROM Salarios
JOIN Funcionarios ON Salarios.id_funcionario = Funcionarios.id_funcionario
WHERE Funcionarios.nome = 'Alice';

-- 5. Atualização de Dados

-- Atualizar o salário de um funcionário específico
UPDATE Funcionarios
SET salario = 3200.00
WHERE nome = 'Alice';

-- Modificar o nome de um departamento
UPDATE Departamentos
SET nome = 'Tecnologia da Informação'
WHERE nome = 'TI';

-- 6. Exclusão de Dados

-- Excluir um funcionário e todos os registros relacionados de salários
DELETE FROM Salarios
WHERE id_funcionario = 1;

DELETE FROM Funcionarios
WHERE id_funcionario = 1;

-- Remover um departamento (apenas se não houver funcionários associados)
DELETE FROM Departamentos
WHERE id_departamento = 1
AND NOT EXISTS (
    SELECT 1 FROM Funcionarios WHERE id_departamento = 1
);
