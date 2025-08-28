use oficina;

insert into cliente (nome, cpf, telefone, endereco) values
	('joão silva', '11122233344', '81988887777', 'rua das flores, 123'),
	('maria oliveira', '55566677788', '81999996666', 'avenida principal, 456'),
	('carlos pereira', '99988877766', '81977775555', 'travessa dos sonhos, 789');

insert into veiculo (placa, modelo, ano, idcliente) values
	('abc1234', 'toyota corolla', 2020, 1),
	('def5678', 'honda civic', 2019, 2),
	('ghi9012', 'ford ka', 2021, 1),
	('jkl3456', 'chevrolet onix', 2022, 3);

insert into equipe (nomeequipe) values 
	('equipe alpha - motor'), 
    ('equipe beta - elétrica');

insert into mecanico (nome, especialidade, idequipe) values
	('pedro alves', 'motor', 1),
	('lucas souza', 'suspensão', 1),
	('ana costa', 'eletricista', 2),
	('beatriz lima', 'injeção eletrônica', 2);

insert into peca (nomepeca, valorunitario) values
	('óleo de motor 5w30', 45.00),
	('filtro de óleo', 25.00),
	('pastilha de freio', 120.00),
	('vela de ignição', 35.00),
	('bateria 60ah', 350.00);

insert into servico (descricaoservico, valormaodeobra) values
	('troca de óleo e filtro', 80.00),
	('troca de pastilhas de freio', 100.00),
	('diagnóstico elétrico', 150.00),
	('alinhamento e balanceamento', 120.00);

insert into ordemservico (dataentrada, dataconclusao, statusos, idveiculo, idequipe) values
	('2025-08-10', '2025-08-11', 'concluída', 1, 1),
	('2025-08-12', null, 'em andamento', 2, 2),
	('2025-08-15', '2025-08-15', 'concluída', 3, 1),
	('2025-08-20', null, 'aguardando', 4, 2);

insert into ordemservico_servico (idordemservico, idservico) values 
	(1, 1),
	(1, 4),
	(2, 3),
	(3, 2);

insert into ordemservico_peca (idordemservico, idpeca, quantidade) values
	(1, 1, 4),
    (1, 2, 1),
    (3, 3, 2);

-- Desabilita o modo de atualização segura para esta sessão
set sql_safe_updates = 0;

update ordemservico os
set os.valortotalmaodeobra = (
    select sum(s.valormaodeobra)
    from ordemservico_servico oss
    join servico s on oss.idservico = s.idservico
    where oss.idordemservico = os.idordemservico
);

-- Habilita o modo de atualização segura novamente 
set sql_safe_updates = 1;

select * from ordemservico;

