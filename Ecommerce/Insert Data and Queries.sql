-- inserção de dados
use ecommerce;

insert into Cliente (first_name, middle_name_initial, last_name, cpf, address)
	values ('Renata', 'J', 'Pinto', '00460110723', 'Rua da Quitanda 19, Cidade Nova - Vinhedo' ),
		   ('Matheus', 'M', 'Pimentel', '01850585706', 'Rua Bala de Prata 38, Transilvania - CM' ),
           ('Nair', 'F', 'Belo', '01950485701', 'Av Cascadura 18, Rio Marinho - Vila Velha' ),
           ('Marcelo', 'P', 'Santos', '02103250594', 'Rua Cel. Moreira Cesar 35, Centro - São Gonçalo' ),
           ('Mariana', 'D', 'Cavalcante', '02799586601', 'Rua das Orquideas 22, Jardim Camburi - Vitoria' ),
           ('Magaly', 'N', 'Pereira', '01930335707', 'Rua das Margaridas 56, Laranjeiras - Serra' ),
           ('Paloma', 'B', 'Barrros', '04450585706', 'Rua Balao Magico 99, Cidade Nova - Itaperuna' ),
           ('Teofilo', 'C', 'Cerqueira', '02140490981', 'Rua Coronel Josino 22, Vila Pavão - Miracema' ),
           ('Tiara', 'D', 'Cabelo', '03378932101', 'Rua das Flores 44, Cehab - Santa Teresa' );
select * from Cliente;

insert into Produto (product_name, unitPrice, classification_kids, category, avaliação, size) 
	values ('Fone de Ouvido', 10, false, 'Eletrônicos','4', null),
		   ('Barbie Elsa', 15, true, 'Brinquedos','3', null),
           ('Body Carters', 10, true, 'Vestimentas','5', null),
           ('Microfone Vedo - Youtuber', 200, false, 'Eletrônicos','4', null),
           ('Sofa retrátil', 400, false, 'Móveis','3', '220x90x80'),
           ('Monitor LED 24"', 400, false, 'Eletrônicos', '4', null),
           ('Agua Mineral', 2, false, 'Alimentos', '5', '500ml'),
		   ('Carabina Ar Comprimido 5,5mm', 100, true, 'Brinquedos', '3', '6x8x120'),
           ('Camisa Polo Masculina', 100, true, 'Vestimentas', '5', null),
           ('Teclado Gamer Mecanico LED', 100, false, 'Eletrônicos', '4', null),
           ('Cadeira de escritorio giratoria', 500,  false, 'Móveis', '3', '65x55x135');
select * from Produto;

 
insert into Pedido (idOrderClient, orderStatus, orderDescription, freight, total, paymentMethod)
	values (1,default,'Compra via Aplicativo', default, null, 'Pix'),
		   (2,default,'Compra via Aplicativo', 50, null, 'Cartão de Crédito'),
           (3,'Confirmado', null, default, null, 'Boleto'),
           (4,'Confirmado',null, default, null, 'Pix'),
           (5, default, 'Compra via Web Site', 150, null, 'Cartão de Crédito');
select * from Pedido;

  
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	values (1,1,2,null),
		   (2,1,1,null),
		   (3,1,1,null);
select * from productOrder;

insert into Estoque (storageLocation, quantity)
	values ('Rio de Janeiro', 1000),
		   ('Rio de Janeiro', 500),
           ('São Paulo', 10),
           ('São Paulo', 100),
           ('São Paulo', 10),
           ('Brasilia', 10);
select * from Estoque;


insert into storageLocation (idLproduct, idLstorage, location)
	values (1,2,'RJ'),
		   (2,6,'GO');
select * from storageLocation;


insert into Fornecedor (razãoSocial, cnpj, contato)
	values ('Almeida e Filhos', '12345678901234', '21995739558'),
		   ('Eletronicos Silva', '43210987654321', '41998956758'),
           ('Eletronicos Valma', '87654321098765', '11996749558');
select * from Fornecedor;


insert into productSupplier (idPsSupplier, idPsProduct, quantity)
	values (1,1,500), 
		   (1,2,400),
		   (2,4,633),
           (3,3,5),
           (2,5,10);
select * from productSupplier;


insert  into Vendedor (razãoSocial, nomeFantasia, cnpj, cpf, vendedorLocal, contato)
	values ('Tech Eletronics', null, 12345678901234, null, 'Rio de Janeiro', 21995718558),
		   ('Boutique Dunga', null, null, 12345678901, 'Rio de Janeiro', 21995893451),
           ('Tech Eletronica', null, 23456789012345, null, 'São Paulo', 1197618552);
select * from Vendedor;

insert into productSeller (idPSeller, idPProduct, prodQuantity)
	values (10,2,80),
           (11,1,10);
select * from productSeller;           

select count(*) from Cliente;
select * from Cliente c, Pedido p where c.idClient = p.idOrderClient;

select count(*) from cliente c, pedido o 
	where c.idclient = idorderclient;

select * from cliente c inner join pedido o on c.idclient = o.idorderclient
	inner join productorder p on p.idPoOrder = o.idorder;
    
    select * from pedido;
    select * from productorder;