-- criação do BD de e-commerce
CREATE DATABASE if not exists ecommerce;
USE ecommerce;

-- criar tabelas
CREATE TABLE if not exists Cliente(
	idClient int auto_increment primary key,
    first_name varchar(10),
    middle_name_initial char(3),
    last_name varchar(20),
    cpf char(11) not null,
    address varchar(255),
    constraint unique_cpf_client unique (cpf)
);

alter table Cliente auto_increment=1;

CREATE TABLE if not exists Produto(
	idProduct int auto_increment primary key,
    product_name varchar(255) not null,
    unitPrice float,
    classification_kids bool default false,
    category enum('Eletrônicos','Vestimentas','Brinquedos','Alimentos','Cosméticos','Móveis','Geral') not null,
    avaliação float default 0,
    size varchar(10)
);

-- implementar e criar as relações
CREATE TABLE if not exists Pagamentos(
	idClient int,
    idPayment int,
    paymentMethod enum('Pix', 'Cartão de Crédito', 'Boleto'),
    paymentValue float,
    primary key(idClient, idPayment)
);

CREATE TABLE if not exists Pedido(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Processando') default 'Processando',
    orderDescription varchar(255),
    freight float default 0,
    total float,
    paymentMethod enum('Pix', 'Cartão de Crédito', 'Boleto'),
    constraint fk_pedido_cliente foreign key (idOrderClient) references Cliente(idClient)
		on update cascade
);

CREATE TABLE if not exists Estoque(
	idStock int auto_increment primary key,
	storageLocation varchar(40),
    quantity int default 0
);

CREATE TABLE if not exists Fornecedor(
	idFornecedor int auto_increment primary key,
    razãoSocial varchar(255) not null,
    cnpj char(15) not null,
    contato varchar(45),
    constraint unique_supplier unique(cnpj)
);

-- sugestão de refinamento, separar pessoa física de pessoa jurídica
CREATE TABLE if not exists Vendedor(
	idVendedor int auto_increment primary key,
    razãoSocial varchar(255) not null unique,
    vendedorLocal varchar(255),
    nomeFantasia varchar(255),
    cnpj char(15),
    cpf char(15),
    contato varchar(45),
    constraint unique_cnpj_seller unique(cnpj),
    constraint unique_cpf_seller unique(cpf)
);

CREATE TABLE if not exists productSeller(
	idPSeller int,
    idPProduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPProduct),
    constraint fk_product_seller foreign key (idPSeller) references Vendedor(idVendedor),
    constraint fk_product_product foreign key (idPProduct) references Produto(idProduct)
);

CREATE TABLE if not exists productOrder (
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem Estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_po_product foreign key (idPOproduct) references Produto(idProduct),
    constraint fk_po_order foreign key (idPOorder) references Pedido(idOrder)
);

CREATE TABLE if not exists storageLocation (
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_product foreign key (idLproduct) references Produto(idProduct),
    constraint fk_storage_storage foreign key (idLstorage) references Estoque(idStock)
);

CREATE TABLE if not exists productSupplier (
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_prodSupplier_product foreign key (idPsProduct) references Produto(idProduct),
    constraint fk_prodSupplier_supplier foreign key (idPsSupplier) references Fornecedor(idFornecedor)
);

-- exploração do BD
-- show databases;
-- use information_schema;
-- show tables;
-- desc REFERENTIAL_CONSTRAINTS;
-- select * from REFERENTIAL_CONSTRAINTS where CONSTRAINT_SCHEMA = 'ecommerce';
