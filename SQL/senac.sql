-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Jan-2023 às 21:14
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `senac`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `Cod_Aluno` int(11) NOT NULL,
  `Matricula_Aluno` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `Endreco` varchar(200) NOT NULL,
  `Tel` varchar(12) NOT NULL,
  `Cod_Turma` int(11) NOT NULL,
  `Sexo` enum('masculino','feminino','nao declarado') DEFAULT 'nao declarado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`Cod_Aluno`, `Matricula_Aluno`, `Nome`, `Endreco`, `Tel`, `Cod_Turma`, `Sexo`) VALUES
(1, 202325698, 'Marcelo Souto', 'Estrada do cachamorra 132', '21999998888', 1, 'masculino'),
(2, 202302584, 'Milena Ernandes', 'Campo grande - centro - 2532', '2188881111', 2, 'feminino'),
(3, 202358480, 'Yasmin Cristine', 'Estrada da posse 1214', '21995884584', 3, 'feminino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `Cod_Curso` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Tipo` enum('ead','presencial','flex') DEFAULT NULL,
  `Tempo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`Cod_Curso`, `Nome`, `Tipo`, `Tempo`) VALUES
(1, 'Técnico de informática', 'ead', '1 ano'),
(2, 'Cabeleiro', 'presencial', '6 meses'),
(3, 'Micro Biologia', 'flex', '1 ano e 6 messes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `Cod_Disc` int(11) NOT NULL,
  `Ementa` varchar(200) NOT NULL,
  `Cont_Prog` varchar(200) NOT NULL,
  `Cod_Prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`Cod_Disc`, `Ementa`, `Cont_Prog`, `Cod_Prof`) VALUES
(1, 'caractere, palavra, unidade de armazenamento e transferência; Evolução do computador e dos sistemas operacionais; Sistemas de numeração e conversão entre os sistemas: decimal, binário, octal e hexadec', '1 – BIMESTRE – Introdução aos conceitos de linguagem de Programação em ambiente “Console”. - Introdução a linguagem C# - Tipos primitivos de dados e consumo de memória. - Conceitos e aplicações em con', 1),
(2, 'Empreendedorismo e inovação. Empreendedorismo: conceitos e perspectiva do empreendedorismo contemplando a criação do negócio, financiamento, gerenciamento, expansão e encerramento do mesmo. Inovação: ', 'Composição e crescimento do cabelo\nTipos de cabelo\nCor do cabelo\nCuidado com o cabelo\nComposição do cabelo\nCiclos Biológicos Do Cabelo\nLavagem do cabelo\nHidratação Profunda\nCauterização\nDescongestiona', 2),
(3, 'História da microbiologia. Células procarióticas. Principais grupos e taxonomia de bactérias e fungos. Crescimento e cultivo de microrganismos. Efeito dos fatores físicos e químicos sobre a atividade ', 'Morfologia e estruturas bacterianas. Nutrição e crescimento bacteriano. Metabolismo bacteriano. Genética bacteriana. Técnicas moleculares para Identificação de Microrganismos. Biologia dos fungos levu', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Matricula_Prof` int(11) NOT NULL,
  `Especialidade` varchar(200) NOT NULL,
  `Cod_Prof` int(11) DEFAULT NULL,
  `Sexo` enum('masculino','feminino','nao declarado') DEFAULT 'nao declarado',
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`Matricula_Prof`, `Especialidade`, `Cod_Prof`, `Sexo`, `nome`, `cpf`) VALUES
(1, 'Técnico de infomatica', 20230001, 'masculino', 'Marcial Souto', '11111111111'),
(2, 'Cabeleiro', 20230002, 'masculino', 'Carlos Amaral', '22222222222'),
(3, 'Microbiologa', 20230003, 'feminino', 'Stephanie Freitas', '33333333333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `Cod_Turma` int(11) NOT NULL,
  `Cod_Disc` int(11) DEFAULT NULL,
  `Cod_Curso` int(11) DEFAULT NULL,
  `Data_Inicio` date DEFAULT NULL,
  `Data_Termino` date DEFAULT NULL,
  `Cod_Prof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`Cod_Turma`, `Cod_Disc`, `Cod_Curso`, `Data_Inicio`, `Data_Termino`, `Cod_Prof`) VALUES
(1, 1, 1, '2023-02-12', '2024-03-14', 1),
(2, 2, 2, '2023-01-28', '2023-06-29', 2),
(3, 3, 3, '2023-01-19', '2024-07-28', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`Cod_Aluno`),
  ADD KEY `Cod_Turma` (`Cod_Turma`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`Cod_Curso`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`Cod_Disc`),
  ADD KEY `Cod_Prof` (`Cod_Prof`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Matricula_Prof`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`Cod_Turma`),
  ADD KEY `Cod_Curso` (`Cod_Curso`),
  ADD KEY `Cod_Disc` (`Cod_Disc`),
  ADD KEY `Cod_Prof` (`Cod_Prof`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `Cod_Aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `Cod_Curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `Cod_Disc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `Matricula_Prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `Cod_Turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`Cod_Turma`) REFERENCES `turma` (`Cod_Turma`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`Cod_Prof`) REFERENCES `professor` (`Matricula_Prof`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`Cod_Curso`) REFERENCES `curso` (`Cod_Curso`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`Cod_Disc`) REFERENCES `disciplina` (`Cod_Disc`),
  ADD CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`Cod_Prof`) REFERENCES `professor` (`Matricula_Prof`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
