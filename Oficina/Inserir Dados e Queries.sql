use oficina;

insert into clientes(customerType, CPF_CNPJ, nomeCompleto, dataNascimento, endereco, cidade, estado, cep, contatoTelefone, email) values 
	(default,'78692386782','Thalita Campos Pacheco Kassab','1999-02-27','Rua Domingos Olímpio, 143', 'Sobral','Ceará', '62011140','(85) 97447-3249','tkassab@teste.com'),
	(default,'11196258589','Mauro Braga Consendey Nunes','1980-07-07','Rua Tenente-Coronel Cardoso, 378', 'Campos dos Goytacazes','Rio de Janeiro', '28035042','(24) 99619-6626','mnunes@teste.com'),
	(default,'00030772680','Kamily Pontes Lucas Leite','1972-11-15','Avenida Afonso Pena, 1385', 'Belo Horizonte','Minas Gerais', '30130005','(37) 99131-4376','kleite@teste.com'),
	(default,'65213260748','Celia Campelo Peçanha de Rodrigues','1978-08-23','Rua Carlos Augusto Cornelsen, 2031', 'Curitiba','Paraná', '80520560','(41) 98196-4623','crodrigues@teste.com');

insert into veiculos(idClienteVeiculo, tipo, marca, modelo, cor, placa) values 
    (1, 'Carro', 'Chevrolet', 'Ônix', 'Preto', 'JZO7H67'),
    (1, 'Moto', 'Honda', 'CG 160 Titan', 'Vermelho', 'LYM5O13'),
    (3, 'Moto', 'Harley Davidson', 'H-D 2023', 'Prata', 'MDW3S19'),
    (2, 'Caminhão', 'Mercedes-Benz', 'Axor', 'Azul', 'KJH1A03'),
    (4, 'Ônibus', 'Volvo', 'Axor', 'Branco', 'KJH1A03');

insert into fornecedores(cnpj, razãoSocial, nomeFantasia, endereco, cidade, cep, estado, nomeContato, telefone, email) values
    ('00.088.409/0001-01', 'Renault LTDA', 'Renault Peças', 'Rua da Prata, 134', 'São José dos Pinhais','99867080','Paraná','Leonardo Souza da Costa','(41) 97526-0879','lsouza@renault.com'),
    ('03.311.972/0001-95', 'Bosch LTDA', 'Bosch', 'Rua da Lua, 523', 'Blumenau','78952047','Santa Catarina','Tassiane Luiza Teixeira Macedo','(42) 99985-7382','tmacedo@bosch.com');

insert into funcionarios(cpf, nomeCompleto, dataNascimento, endereco, cidade, cep, estado, telefone, email, função, setor) values
    ('064.526.448-23', 'Lara Aparecida Milena Freitas', '1979-01-08', 'Rua José Magalhães, 455', 'Rio Branco', '69918724', 'Acre', '(68) 99305-7990', 'lfreitas@teste.com.br', 'Administrativo', 'Administração'),
    ('428.650.194-97', 'Rayssa Priscila Barbosa', '1965-05-02', 'Rua Três, 43', 'Rio Grande', '96210078', 'Rio Grande do Sul', '(53) 99178-3593', 'rayssa.priscila.barbosa@gvmail.br', 'Vendedor', 'Vendas'),
    ('803.143.291-02', 'Joana Nicole Caldeira', '1963-02-01', 'Rua Higienópolis, 832', 'Porto Velho', '76813348', 'Rondônia', '(69) 99691-2439', 'joananicolecaldeira@findout.com.br', 'Mecânico', 'Oficina'),
    ('663.533.148-41', 'João Luan Yago Baptista', '1996-05-24', 'Travessa Sargento Rocha, 644', 'Salvador', '41925250', 'Bahia', '(71) 98508-5887', 'joaoluanbaptista@fredericodiniz.com', 'Mecânico', 'Oficina'),
    ('160.770.051-42', 'Renan Noah Enzo da Luz', '1974-02-25', 'Travessa Augusto de Ross, 331', 'Francisco Beltrão', '85604266', 'Paraná', '(46) 99131-1342', 'renan.noah.daluz@ipmmi.org.br', 'Latoeiro', 'Oficina'),
    ('744.583.823-65', 'Antonio Eduardo Gustavo de Paula', '2004-03-24', 'Praça José de Abreu, 860', 'Itaguaí,', '23836360', 'Rio de Janeiro', '(21) 98100-9912', 'antonio.eduardo.depaula@castromobile.com.br', 'Lavador', 'Oficina'),    
    ('613.573.057-61', 'Lorena Andrea da Mota', '1963-02-24', 'Travessa Quatro de Janeiro, 949', 'São Luís,', '65073400', 'Maranhão', '(98) 98791-4502', 'lorena-damota96@slb.com', 'Recepcionista', 'Administração');

insert into produtos(nomeProduto, fabricante, idProdFornecedor, quantidade, precoUnitario) values
    ('Parafuso', 'Metaleiros Materiais', 1, 10, 1.5),
    ('Vela de Motor', 'NGK', 2, 3, 5),
    ('Calota de Pneu', 'Continental', 2, 20, 3);

insert into serviços(nomeServiço, tipoServiço, precoUnitario) values 
    ('Desamassar Lataria', 'Funilagem', 100),
    ('Pintura de Arranhados', 'Pintura', 52),
    ('Lavagem com Polimento', 'Polimento', 37),
    ('Motor', 'Mecânica', 123),
    ('Troca de Catalisador', 'Mecânica', 84);

insert into ordemVenda(idClienteOrdemVenda, dataEmissão, dataEntrega, valorTotal, osStatus) values
    (1, '2023-05-09', '2023-05-10', 500, 'Concluída'),
    (1, '2023-09-06','2023-09-10', 2537.90, 'Pendente'),
    (2, '2023-08-15','2023-08-16', 500, 'Cancelada'),
    (3, '2023-07-22', '2023-08-01', 300, 'Concluída'),
    (2, '2023-09-06', '2023-09-07', 400, 'Em andamento'),
    (4, '2023-09-07', '2023-09-15', 1237.80, 'Orçamento'),
    (4, '2023-08-07', '2023-09-11', 178.93, 'Autorizada');

insert into itensVenda(idOrdemVendaItem, idItemProduto, quantidade, valorItem) values
    (1, 3, 5, 10),
    (1, 2, 1, 200),
    (2, 3, 5, 10);

insert into ordemServiço(idClienteOrdemServiço, idVeiculoOrdemServiço, idOrdemCompraServiço, dataEmissão, dataEntrega, valorTotal, osStatus, idFuncionarioServico) values
    (1, 1, 1, '2023-05-09', '2023-05-10', 500, 'Concluída', 7),
    (1, 2, null, '2023-09-06','2023-09-10', 2537.90, 'Pendente', 2),
    (2, 4, 3, '2023-08-15','2023-08-16', 500, 'Cancelada', 6),
    (3, 3, null, '2023-07-22', '2023-08-01', 300, 'Concluída', 5),
    (2, 4, null, '2023-09-06', '2023-09-07', 400, 'Em andamento', 2),
    (4, 5, null, '2023-09-07', '2023-09-15', 1237.80, 'Orçamento', 1),
    (4, 5, null, '2023-08-07', '2023-09-11', 178.93, 'Autorizada', 3);

insert into itensServiço(idOrdemServiçoItem, idItemServiço, quantidade, valorItem) values
    (1, 1, 2, 300),
    (1, 2, 1, 200),
    (4, 4, 1, 200);

select * from clientes;
select * from veiculos;
select * from fornecedores;
select * from funcionarios;
select * from produtos;
select * from serviços;
select * from ordemVenda;
select * from itensVenda;
select * from ordemServiço;
select * from itensServiço;

-- Qual a quantidade de funcionários?
select count(*) as 'Quantidade de Funcionários' from funcionarios;

-- Qual a contagem de funcionários por estado?
select estado, count(*) from funcionarios group by estado;

-- Quem são os funcionários com mais de 50 anos? (duas possibilidades)
select * from funcionarios where dataNascimento < '1973-09-06';
select * from funcionarios where EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM dataNascimento) > 50 order by dataNascimento;

-- Quais ordens de serviço foram concluídas, em quanto tempo, por quais funcionários e para quais clientes?
select os.idOrdemServiço as 'ID', c.nomeCompleto as 'Cliente', os.valorTotal as 'Valor Total', dataEntrega - dataEmissão as 'Tempo de Serviço', f.nomeCompleto as 'Funcionários'
	from ordemServiço os 
    inner join clientes c 
    on os.idClienteOrdemServiço = c.idCliente
    inner join funcionarios f
    on os.idFuncionarioServico = f.idFuncionario
    where os.osStatus = 'Concluída'
    order by os.ValorTotal;