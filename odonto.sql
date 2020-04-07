-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29-Nov-2019 às 13:12
-- Versão do servidor: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `odonto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `data_nascimento`, `data_cadastro`, `cpf`, `rg`, `telefone`, `email`, `endereco`, `cep`, `sexo`) VALUES
(1, ' Geraldo Bryan Novaes', '1979-07-07', '2019-11-19', '116.227.326-77', '17.266.556-5', ' 99538-3294', ' ggeraldobryannovaes@moderna.com.br', ' Rua Colina das Palmeiras', ' 59151-130', 'M'),
(2, ' Henry Felipe Lopes', '2000-06-02', '2019-11-21', '050.545.299-50', '48.678.863-5', '98489-9922', ' henryfelipelopes_@maccropropaganda.com.br', ' Rua Rua 10 Chácara 178', ' 72007-390', 'M'),
(4, ' Francisca Patrícia Louise ', '1998-12-10', '2019-11-24', '742.271.799-80', '31.890.745-8', '98629-5230', ' ffranciscapatricialouise@mavex.coteste.br', ' Rua Deputado Ribeiro Magalhães', ' 64213-060', 'F'),
(5, ' Juan Henry Thiago Baptista', '2000-04-24', '2019-11-29', '313.511.446-50', '37.150.781-9', '99951-4745', 'juanhenrythiagobaptista@freitas.net.br', ' Avenida Tocantins 526', ' 77560-970', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `valor_consulta` decimal(10,2) DEFAULT NULL,
  `status_consulta` varchar(45) DEFAULT NULL,
  `pagou` datetime DEFAULT NULL,
  `tipo_pagamento` varchar(45) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_dentista` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Consulta_Cliente_idx` (`id_cliente`),
  KEY `fk_Consulta_Dentista1_idx` (`id_dentista`),
  KEY `fk_consulta_servicos1_idx` (`id_servico`),
  KEY `fk_consulta_funcionario1_idx` (`id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id`, `data_consulta`, `hora_consulta`, `valor_consulta`, `status_consulta`, `pagou`, `tipo_pagamento`, `id_cliente`, `id_dentista`, `id_servico`, `id_funcionario`) VALUES
(2, '2001-06-02', '11:00:00', '50.00', 'compareceu', '2019-11-23 21:44:02', 'cartao', 1, 1, 3, 1),
(9, '2019-12-18', '10:30:00', NULL, NULL, NULL, NULL, 4, 3, 4, 1),
(10, '2019-11-20', '11:00:00', NULL, 'ausente', NULL, NULL, 2, 9, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dentista`
--

CREATE TABLE IF NOT EXISTS `dentista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `cfo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Dentista_Perfil1_idx` (`id_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `dentista`
--

INSERT INTO `dentista` (`id`, `nome`, `data_nascimento`, `data_cadastro`, `cpf`, `rg`, `cfo`, `telefone`, `email`, `endereco`, `cep`, `sexo`, `login`, `senha`, `status`, `id_perfil`) VALUES
(1, ' Renan Kaique Márcio', '1999-09-15', '2019-11-19', '507.943.762-66', '50.817.583-5', '376.538.83', '98818-3333', ' renankaiquemarciodarocha_@gmail.com', 'Rua Rio Paraíba', ' 35162-007', 'M', 'renan', '1', 'ativo', 1),
(3, ' Vera Agatha Souza', '1990-06-02', '2019-11-24', '106.666.146-44', '27.020.956-6', ' 2943.3666', '99772-6722', ' veraagathasouza@doublesp.com.br', ' Vila Campos', ' 66065-098', 'F', 'vera', '1', 'ativo', 1),
(8, ' César Cláudio Almeida', '1981-10-21', '2019-11-24', '993.237.489-00', '39.058.538-5', '2584.5996', '99122-4637', ' cesarclaudioalmeida_@iaru.com', ' Rua Itumbiara', ' 65912-230', 'M', 'cesar', '1', 'ativo', 2),
(9, ' Gabrielly Flávia Assis', '1994-12-15', '2019-11-24', '350.293.417-73', '50.607.692-1', '3870.5353', '98414-2620', 'gabriellyflaviaassis@gmail.com', ' Travessa Feijó', ' 69907-551', 'F', 'gabrielly', '1', 'ativo', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Funcionario_Perfil1_idx` (`id_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `data_nascimento`, `data_cadastro`, `cpf`, `rg`, `telefone`, `email`, `endereco`, `cep`, `sexo`, `login`, `senha`, `status`, `id_perfil`) VALUES
(1, ' Clarice Sandra Rita Viana', '2001-06-02', '2019-11-19', '129.132.451-88', '50.343.139-4', '99583-4666', 'claricesandraritaviana@nextel.com.br', ' Rua André Zancope', ' 13201-140', 'F', 'clarice', '1', 'ativo', 3),
(2, ' Cristiane Lúcia Rosa da Silva', '1999-07-10', '2019-11-23', '037.334.528-36', '15.940.853-2', '99462-5519', 'cristianeluciarosadasilva@mushsanches.com', ' Rua Yara', ' 17513-370', 'F', 'cristiane', '1', 'ativo', 3),
(5, ' Maya Louise Malu das Neves', '1998-01-27', '2019-11-24', '910.588.590-64', '22.187.590-6', '99524-9897', 'mayalouisemaludasneves@ygui.com.br', ' Rodovia Juscelino Kubitschek', ' 68902-026', 'F', 'maya', '1', 'ativo', 3),
(7, 'admin', '2019-11-13', '0000-00-00', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'M', 'admin', '1', 'ativo', 1),
(8, 'Clarice Sandra Rita Viana', '2001-06-02', '2019-11-29', '129.132.451-88', '50.343.139-4', '99583-4666', 'claricesandraritaviana@nextel.com.br', 'Rua André Zancope', '13201-140', 'F', '	 clarice', '1', 'ativo', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `link`, `icone`) VALUES
(1, 'Clientes', 'listar_cliente.jsp', 'cliente.png'),
(2, 'Dentistas', 'listar_dentista.jsp', 'dentista.png'),
(3, 'Menus', 'listar_menu.jsp', 'menu.png'),
(4, 'Perfis', 'listar_perfil.jsp', 'perfil.png'),
(5, 'Atendentes ', 'listar_funcionario.jsp', 'funcionario.png'),
(6, 'Serviços ', 'listar_servicos.jsp', 'servicos.png'),
(7, 'Consultas', 'listar_consulta.jsp', 'consulta.png'),
(8, 'Consultas ', 'listar_consulta_dentista.jsp', 'consulta_dentista.png'),
(9, 'Clientes ', 'listar_cliente_dentista.jsp', 'cliente_dentista.png'),
(10, 'Atendentes', 'listar_funcionario_dentista.jsp', 'dentista.png'),
(11, 'Dentistas', 'listar_dentista_dentista.jsp', 'dentista.png'),
(12, 'Serviços', 'listar_servicos_dentista.jsp', 'servicos.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'Administrador', 'Administrador do Sistema'),
(2, 'Dentista ', 'Dentista de manutenÃ§Ã£o'),
(3, 'Atendente', 'Atendente ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_menu`
--

CREATE TABLE IF NOT EXISTS `perfil_menu` (
  `id_perfil` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_perfil`,`id_menu`),
  KEY `fk_Perfil_has_Menu_Menu1_idx` (`id_menu`),
  KEY `fk_Perfil_has_Menu_Perfil1_idx` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`id_perfil`, `id_menu`) VALUES
(1, 1),
(3, 1),
(1, 2),
(3, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(3, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE IF NOT EXISTS `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`) VALUES
(1, 'Manutençao'),
(3, 'Ortondontia'),
(4, 'Clareamento'),
(5, 'Limpeza');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_Consulta_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Consulta_Dentista1` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_servicos1` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `dentista`
--
ALTER TABLE `dentista`
  ADD CONSTRAINT `fk_Dentista_Perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_Funcionario_Perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_Perfil_has_Menu_Menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Perfil_has_Menu_Perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
