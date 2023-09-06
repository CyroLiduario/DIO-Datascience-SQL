use oficina;

-- Criação das tabelas

insert into clientes(customerType, CPF_CNPJ, nomeCompleto, dataNascimento, endereco, cidade, estado, cep, contatoTelefone, email)
    values (default,'78692386782','Thalita Campos Pacheco Kassab','1999-02-27','Rua Domingos Olímpio, 143', 'Sobral','Ceará', '62011140','(85) 97447-3249','tkassab@teste.com'),
        (default,'11196258589','Mauro Braga Consendey Nunes','1980-07-07','Rua Tenente-Coronel Cardoso, 378', 'Campos dos Goytacazes','Rio de Janeiro', '28035042','(24) 99619-6626','mnunes@teste.com'),
        (default,'00030772680','Kamily Pontes Lucas Leite','1972-11-15','Avenida Afonso Pena, 1385', 'Belo Horizonte','Minas Gerais', '30130005','(37) 99131-4376','kleite@teste.com'),
        (default,'65213260748','Celia Campelo Peçanha de Rodrigues','1978-08-23','Rua Carlos Augusto Cornelsen, 2031', 'Curitiba','Paraná', '80520560','(41) 98196-4623','crodrigues@teste.com');

insert into veiculos(idClienteVeiculo, tipo, marca, modelo, cor, placa) values 
    (1, 'Carro', 'Chevrolet', 'Ônix', 'Preto', 'JZO7H67'),
    (1, 'Moto', 'Honda', 'CG 160 Titan', 'Vermelho', 'LYM5O13'),
    (3, 'Moto', 'Harley Davidson', 'H-D 2023', 'Prata', 'MDW3S19'),
    (2, 'Caminhão', 'Mercedes-Benz', 'Axor', 'Azul', 'KJH1A03'),
    (4, 'Ônibus', 'Volvo', 'Axor', 'Branco', 'KJH1A03');

-- Para referência das tabelas:
create table fornecedores(
    idFornecedor int auto_increment primary key,
    cnpj varchar(14) not null unique,
    razãoSocial varchar(255) not null,
    nomeFantasia varchar(255),
    endereco varchar(255) not null,
    cidade varchar(50) not null,
    cep varchar(8) not null,
    estado varchar(30) not null,
    nomeContato varchar(50) not null,
    telefone varchar(11) not null,
    email varchar(100) not null
);

create table funcionarios(
    idFuncionario int auto_increment primary key,
    cpf char(14) not null unique,
    nomeCompleto varchar(255) not null,
    dataNascimento date not null,
    endereco varchar(255) not null,
    cidade varchar(50) not null,
    cep varchar(8) not null,
    estado varchar(30) not null,
    telefone varchar(11) not null,
    email varchar(100) not null,
    função enum('Mecânico','Latoeiro','Administrativo','Vendedor','Recepcionista','Lavador') not null,
    setor enum('Oficina', 'Vendas', 'Administração') not null
);

create table produtos(
    idProduto int auto_increment primary key,
    nomeProduto varchar(200) not null,
    fabricante varchar(200) not null,
    idProdFornecedor int,
    quantidade int not null default 0,
    precoUnitario float,
    constraint fk_produtos_fornecedor foreign key (idProdFornecedor) references fornecedores(idFornecedor)
);

create table serviços(
    idServiço int auto_increment primary key,
    nomeServiço varchar(50) not null,
    tipoServiço enum('Funilagem','Pintura','Polimento','Mecânica'),
    precoUnitario float not null
);

create table ordemVenda(
    idOrdemVenda int auto_increment primary key,
    idClienteOrdemVenda int,
    dataEmissão date,
    dataEntrega date not null,
    valorTotal float,
    osStatus enum('Orçamento','Pendente','Autorizada','Em andamento','Concluída','Cancelada'),
    constraint fk_ordemVenda_Cliente foreign key (idClienteOrdemVenda) references clientes(idCliente)
);

create table itensVenda(
    idItem int auto_increment primary key,
    idOrdemVendaItem int,
    idItemProduto int,
    quantidade int,
    valorItem float,
    constraint fk_itensVenda_produto foreign key (idItemProduto) references produtos(idProduto),
    constraint fk_itensVenda_OrdemVenda foreign key (idOrdemVendaItem) references ordemVenda(idOrdemVenda)
);

create table ordemServiço(
    idOrdemServiço int auto_increment primary key,
    idClienteOrdemServiço int,
    idVeiculoOrdemServiço int,
    idOrdemCompraServiço int null,
    dataEmissão date,
    dataEntrega date not null,
    valorTotal float,
    osStatus enum('Orçamento','Pendente','Autorizada','Em andamento','Concluída','Cancelada'),
    idFuncionarioServico int,    
    constraint fk_ordemServiço_cliente foreign key (idClienteOrdemServiço) references clientes(idCliente),
    constraint fk_ordemServiço_veiculos foreign key (idVeiculoOrdemServiço) references veiculos(idVeiculo),
    constraint fk_serviço_produto foreign key (idOrdemCompraServiço) references ordemVenda(idOrdemVenda),
    constraint fk_funcionario_ordemServiço foreign key (idFuncionarioServico) references funcionarios(idFuncionario)
);

create table itensServiço(
    idItem int auto_increment primary key,
    idOrdemServiçoItem int,
    idItemServiço int,
    quantidade int,
    valorItem float,
    constraint fk_itensServiço_serviço foreign key (idItemServiço) references serviços(idServiço),
    constraint fk_itensServiço_OrdemServiço foreign key (idOrdemServiçoItem) references ordemServiço(idOrdemServiço)
);