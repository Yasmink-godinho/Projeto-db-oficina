create database oficina;
use oficina;

create table cliente (
    idcliente int auto_increment primary key,
    nome varchar(255) not null,
    cpf char(11) not null unique,
    telefone varchar(20),
    endereco varchar(255)
);

create table veiculo (
    idveiculo int auto_increment primary key,
    placa varchar(10) not null unique,
    modelo varchar(50) not null,
    ano int,
    idcliente int,
    foreign key (idcliente) references cliente(idcliente)
);

create table equipe (
    idequipe int auto_increment primary key,
    nomeequipe varchar(100) not null
);

create table mecanico (
    idmecanico int auto_increment primary key,
    nome varchar(255) not null,
    especialidade varchar(100),
    idequipe int,
    foreign key (idequipe) references equipe(idequipe)
);

create table ordemservico (
    idordemservico int auto_increment primary key,
    dataentrada date not null,
    dataconclusao date,
    statusos enum('aguardando', 'em andamento', 'concluída', 'cancelada') not null,
    valortotalmaodeobra decimal(10, 2) default 0.00,
    idveiculo int,
    idequipe int,
    foreign key (idveiculo) references veiculo(idveiculo),
    foreign key (idequipe) references equipe(idequipe)
);

create table servico (
    idservico int auto_increment primary key,
    descricaoservico varchar(255) not null,
    valormaodeobra decimal(10, 2) not null
);

create table peca (
    idpeca int auto_increment primary key,
    nomepeca varchar(150) not null,
    valorunitario decimal(10, 2) not null
);

create table ordemservico_servico (
    idordemservico int,
    idservico int,
    primary key (idordemservico, idservico),
    foreign key (idordemservico) references ordemservico(idordemservico),
    foreign key (idservico) references servico(idservico)
);

create table ordemservico_peca (
    idordemservico int,
    idpeca int,
    quantidade int not null,
    primary key (idordemservico, idpeca),
    foreign key (idordemservico) references ordemservico(idordemservico),
    foreign key (idpeca) references peca(idpeca)
);