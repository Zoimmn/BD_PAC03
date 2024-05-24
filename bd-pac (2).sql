CREATE TABLE IF NOT EXISTS `Usuarios` (
	`uuidUsuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeUsuario` varchar(50) NOT NULL,
	`sobrenomeUsuario` varchar(200) NOT NULL,
	`emailUsuario` varchar(200) NOT NULL,
	`uuidEndereco` int NOT NULL,
	`senhaUsuario` varchar(500) NOT NULL,
	`cpf` varchar(14) NOT NULL UNIQUE,
	PRIMARY KEY (`uuidUsuario`)
);

CREATE TABLE IF NOT EXISTS `Enderecos` (
	`uuidEndereco` int AUTO_INCREMENT NOT NULL UNIQUE,
	`rua` varchar(200) NOT NULL,
	`bairro` varchar(100) NOT NULL,
	`uuidCidade` varchar(32) NOT NULL,
	PRIMARY KEY (`uuidEndereco`)
);

CREATE TABLE IF NOT EXISTS `Paises` (
	`uuidPais` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomePais` varchar(50) NOT NULL,
	PRIMARY KEY (`uuidPais`)
);

CREATE TABLE IF NOT EXISTS `Estados` (
	`uuidEstado` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeEstado` varchar(200) NOT NULL,
	`uuidPais` varchar(32) NOT NULL,
	PRIMARY KEY (`uuidEstado`)
);

CREATE TABLE IF NOT EXISTS `Cidades` (
	`uuidCidades` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeCidade` varchar(200) NOT NULL,
	`uuidEstado` varchar(32) NOT NULL,
	PRIMARY KEY (`uuidCidades`)
);

ALTER TABLE `Usuarios` ADD CONSTRAINT `Usuarios_fk4` FOREIGN KEY (`uuidEndereco`) REFERENCES `Enderecos`(`uuidEndereco`);
ALTER TABLE `Enderecos` ADD CONSTRAINT `Enderecos_fk3` FOREIGN KEY (`uuidCidade`) REFERENCES `Cidades`(`uuidCidades`);

ALTER TABLE `Estados` ADD CONSTRAINT `Estados_fk2` FOREIGN KEY (`uuidPais`) REFERENCES `Paises`(`uuidPais`);
ALTER TABLE `Cidades` ADD CONSTRAINT `Cidades_fk2` FOREIGN KEY (`uuidEstado`) REFERENCES `Estados`(`uuidEstado`);