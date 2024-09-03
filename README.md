# Projeto 7 - Sistema de Gestão de Funcionários

## Descrição do Projeto

Desenvolver um sistema de banco de dados para gerenciar funcionários, departamentos e salários de uma empresa. O sistema deve permitir o registro e atualização das informações dos funcionários, a gestão dos departamentos, e a administração dos salários. O projeto deve utilizar comandos SQL para criar, consultar, atualizar e excluir dados das tabelas.

## Comandos Utilizados

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT`
- `SELECT`
- `UPDATE`
- `DELETE`
- `JOIN`

## Objetivos

1. **Criar o Banco de Dados:**
   - Criar um banco de dados chamado **GestaoFuncionarios**.

2. **Criar as Tabelas:**
   - **Departamentos:**
     - Campos: `id_departamento` (INT, PRIMARY KEY, AUTO_INCREMENT), `nome` (VARCHAR(50), NOT NULL).
   - **Funcionarios:**
     - Campos: `id_funcionario` (INT, PRIMARY KEY, AUTO_INCREMENT), `nome` (VARCHAR(100), NOT NULL), `cargo` (VARCHAR(50), NOT NULL), `salario` (DECIMAL(10, 2), NOT NULL), `id_departamento` (INT, FOREIGN KEY, REFERENCES Departamentos(id_departamento)).
   - **Salarios:**
     - Campos: `id_salario` (INT, PRIMARY KEY, AUTO_INCREMENT), `id_funcionario` (INT, FOREIGN KEY, REFERENCES Funcionarios(id_funcionario)), `data` (DATE, NOT NULL), `valor` (DECIMAL(10, 2), NOT NULL).

3. **Inserir Dados:**
   - Adicionar registros nas tabelas **Departamentos**, **Funcionarios** e **Salarios** para testar o sistema.

4. **Consultas:**
   - Listar todos os funcionários e seus respectivos departamentos.
   - Mostrar o salário total de cada departamento.
   - Verificar os salários históricos de um funcionário específico.

5. **Atualização de Dados:**
   - Atualizar o salário de um funcionário específico.
   - Modificar o nome de um departamento.

6. **Exclusão de Dados:**
   - Excluir um funcionário e todos os registros relacionados de salários.
   - Remover um departamento, garantindo que não existam funcionários associados antes de deletar.

## Requisitos Adicionais

- Utilizar comandos `JOIN` para consultas envolvendo múltiplas tabelas.
- Garantir a integridade referencial entre as tabelas.
