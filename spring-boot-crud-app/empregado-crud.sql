-- phpMyAdmin SQL Dump
-- version 7.3.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2020 at 17:15 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `empresa-crud`
--

-- --------------------------------------------------------

--
-- Estrutra da tabela `empregado`
--

CREATE TABLE `empregado` (
  `id` bigint(20) NOT NULL,
  `empregadoId` varchar(10) NOT NULL,
  `primeiro_nome` varchar(50) NOT NULL,
  `ultimo_nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `data_nascimento` date NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `designacao` varchar(50) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indices para tabelas dumped 
--

--
-- Indices (únicos) para tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empregadoId` (`empregadoId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `UK_fopic1oh5oln2khj8eat6ino0` (`email`),
  ADD UNIQUE KEY `UK_b1mxe45xmg50xv95qv27fo6hd` (`empregadoId`);

--
-- AUTO_INCREMENT para tabelas dumped 
--

--
-- AUTO_INCREMENT para tabela `empregado`
--
ALTER TABLE `empregado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
