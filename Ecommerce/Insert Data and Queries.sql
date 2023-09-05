-- inserção de dados
use ecommerce;

insert into Cliente (first_name, middle_name_initial, last_name, cpf, address)
	values ('Luis', 'J', 'Alvares', '05676487020', 'Rua Marechal Hermes 999, Centro Cívico - Curitiba' ),
		   ('Matheus', 'S', 'Pereira', '89018521019', 'Praça Mauá 1, Centro - Rio de Janeiro' ),
           ('Luana', 'F', 'Carvalho', '90793356067', 'Rua da Imperatriz 220, Centro - Petrópolis' ),
           ('Laura', 'T', 'Santos', '82462689028', 'Praça da Luz 2, Luz - São Paulo' ),
           ('Mariana', 'C', 'Alcantara', '84372490070', 'Esplanada dos Ministérios 12, Centro - Brasília' ),
           ('Antonio', 'P', 'Magalhães', '49478387014', 'Rua da Guia s.n., Recife - Recife' ),
           ('Paulo', 'N', 'Barrros', '14658988089', 'Largo de São Sebastião s.n., Centro - Manaus' ),
           ('Enzo', 'R', 'Souza', '69214026068', 'Largo do Bonfim, s.n., Bonfim - Salvador' ),
           ('Valentina', 'G', 'Tavares', '19285536050', 'Av. Nossa Sra. dos Navegantes, 700A, Enseada do Suá - Vitória' );
select * from Cliente;

insert into Produto (product_name, unitPrice, classification_kids, category, avaliação, size) 
	values ('Headset Beats', 10, false, 'Eletrônicos','4', null),
		   ('Barbie Margot Robbie', 15, true, 'Brinquedos','3', null),
           ('Polo Masculina', 10, true, 'Vestimentas','5', null),
           ('Projetor Portátil', 200, false, 'Eletrônicos','4', null),
           ('Cadeira Gamer', 400, false, 'Móveis','3', '65x55x135'),
           ('Console Xbox Series X', 2400, false, 'Eletrônicos', '4', null),
           ('Suco Natural de Laranka', 2, false, 'Alimentos', '5', '500ml'),
		   ('Drone', 100, false, 'Eletrônicos', '3', '6x8x120'),
           ('Vestido Curto de Verão', 100, true, 'Vestimentas', '5', null),
           ('Monitor Widescreen 24"', 500, false, 'Eletrônicos', '4', null),
           ('Poltrona Reclinável', 500,  false, 'Móveis', '3', '87x74x110');
select * from Produto;

 
insert into Pedido (idOrderClient, orderStatus, orderDescription, freight, total, paymentMethod)
	values (1,default,'Compra via Website', default, null, 'Pix'),
		   (2,default,'Compra via App', 50, null, 'Cartão de Crédito'),
           (3,'Confirmado', null, default, null, 'Boleto'),
           (4,'Confirmado',null, default, null, 'Pix'),
           (5, default, 'Compra via App', 150, null, 'Cartão de Crédito');
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
           ('Curitiba', 10);
select * from Estoque;


insert into storageLocation (idLproduct, idLstorage, location)
	values (1,1,'RJ'),
		   (2,4,'SP'),
           (3,6,'CWB');
select * from storageLocation;


insert into Fornecedor (razãoSocial, cnpj, contato)
	values ('Nuk Eletrônicos', '20193431000129', '(91) 96854-2059'),
		   ('Morena Rosa', '98442296000103', '(38) 97271-9255'),
           ('Matel', '07247686000169', '(48) 99165-6306'),
           ('Madeira Madeira', '42546135000105', '(63) 99338-7417');
select * from Fornecedor;


insert into productSupplier (idPsSupplier, idPsProduct, quantity)
	values (1,1,500), 
		   (3,2,400),
		   (2,4,633),
           (1,3,5),
           (4,5,10);
select * from productSupplier;

insert  into Vendedor (razãoSocial, nomeFantasia, cnpj, cpf, vendedorLocal, contato)
	values ('Quick Eletrônicos', null, 41607992000105, null, 'Curitiba', '(61) 98273-7497'),
		   ('Boutique Paetas', null, null, 90013444000154, 'Vitória', '(53) 97968-8260'),
           ('Eletrotech', null, 82546008000112, null, 'Rio Branco', '(69) 97985-9158');
select * from Vendedor;

insert into productSeller (idPSeller, idPProduct, prodQuantity)
	values (1,1,80),
           (2,3,10);
select * from productSeller;           

select count(*) from Cliente;
select * from Cliente c, Pedido p where c.idClient = p.idOrderClient;

select count(*) from cliente c, pedido p 
	where c.idclient = p.idOrderClient;

select * from cliente c inner join pedido p on c.idclient = p.idOrderClient
	inner join productOrder po on po.idPoOrder = p.idOrder;
    
    select * from pedido;
    select * from productorder;