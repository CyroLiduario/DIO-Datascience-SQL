drop database oficina;

create database if not exists oficina;
use oficina;

-- Criação das tabelas

create table clientes(
    idCliente int auto_increment primary key,
    customerType enum('Pessoa Jurídica','Pessoa Física') default 'Pessoa Física',
    CPF_CNPJ varchar(18) not null unique,
    nomeCompleto varchar(255) not null,
    dataNascimento date,
    endereco varchar(255) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    cep varchar(9) not null,
    contatoTelefone varchar(15) not null,
    email varchar(100) not null
);

create table veiculos(
    idVeiculo int auto_increment primary key,
    idClienteVeiculo int,
    tipo enum('Carro', 'Moto', 'Caminhão', 'Ônibus'),
    marca varchar(45),
    modelo varchar(45),
    cor varchar(10),
    placa char(8),
    constraint fk_veiculo_cliente foreign key (idClienteVeiculo) references clientes(idCliente)
);

create table fornecedores(
    idFornecedor int auto_increment primary key,
    cnpj varchar(18) not null unique,
    razãoSocial varchar(255) not null,
    nomeFantasia varchar(255),
    endereco varchar(255) not null,
    cidade varchar(50) not null,
    cep varchar(9) not null,
    estado varchar(30) not null,
    nomeContato varchar(50) not null,
    telefone varchar(15) not null,
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
    telefone varchar(15) not null,
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