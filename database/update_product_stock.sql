DROP TABLE IF EXISTS `invoicedetails`;
CREATE TABLE `invoicedetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `price_each` double NOT NULL,
  `product_stock_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1C963275C04FC7EF` (`invoice_id`)
);
drop table purchasedetails;
CREATE TABLE `purchasedetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `price_each` double NOT NULL,
  `product_stock_id` bigint(20) NOT NULL,
  `purchase_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
update product_stock set lot=upper(lot) where lot is not null;
--update proformadetails set product_id=101 where product_id=61;
--update proformadetails set product_id=102 where product_id=62;
--update proformadetails set product_id=103 where product_id=63;
--update product_stock set product_id=103 where product_id=63;
--update product_stock set product_id=102 where product_id=62;
--update product_stock set product_id=101 where product_id=61;
INSERT INTO `products` VALUES (61,'PKU gel naranja (Caja x 30 sobres)',41,270,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niÃ±os con fenilcetonuria desde los 12 meses a los 10 aÃ±os de edad. ','Disabled',7,7,20,'PKU gel',NULL,309.02,202.9),(62,'PKU gel frambuesa (Caja x 30 sobres)',41,270,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niÃ±os con fenilcetonuria desde los 12 meses a los 10 aÃ±os de edad. ','Disabled',7,9,20,'PKU gel',NULL,309.02,202.9),(63,'PKU gel s/sabor (Caja x 30 sobres)',41,270,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niÃ±os con fenilcetonuria desdelos 12 meses a los 10 aÃ±os de edad. \r\n','Disabled',7,7,20,'PKU gel',NULL,309.02,202.9);
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, id,0 from product_stock where lot in (select lot from product_stock group by lot having count(*) = 1);
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 1,0 from product_stock where lot='22012A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 24,0 from product_stock where lot='20482B';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 46,0 from product_stock where lot='12463C';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 100,0 from product_stock where lot='12793C';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 16,0 from product_stock where lot='12822A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 7,0 from product_stock where lot='12993A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 92,0 from product_stock where lot='20052';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 4,0 from product_stock where lot='20161';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 118,0 from product_stock where lot='20341A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 79,0 from product_stock where lot='20432A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 115,0 from product_stock where lot='21083B';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 2,0 from product_stock where lot='21123B';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 122,0 from product_stock where lot='22221A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 18,0 from product_stock where lot='22301';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 138,0 from product_stock where lot='22493B';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 13,0 from product_stock where lot='22663';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 147,0 from product_stock where lot='23492A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 150,0 from product_stock where lot='30324';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 160,0 from product_stock where lot='30671';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 149,0 from product_stock where lot='30151A';
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 161,0 from product_stock where lot='30244A';
delete from product_stock where id in (9,10,11,21,23,51,77,95,101,135,136,88,121,84,119,76,78,128,125,105,113,140,143,154,14,45,80,152,157,152,162,164,174,178);
--insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails);
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23301A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23301B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='30151A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='20482B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23011A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='20622A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='22054';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23492A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23481';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='20892D';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21684B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21684C';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21083B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21624B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='30293';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23332';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='30341';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='30324';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21192B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='22493B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='22221A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='12412';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21311';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23584';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='20904';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='22243A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21123B';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='21123C';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='12761A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='23251A';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='22932F';
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails) and ps.lot='22932D';
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,241,188.17,4,3);
update invoicedetails set quantity=2, price_each=43.49 where invoice_id=10 and product_stock_id=97;
update invoicedetails set quantity=2, price_each=43.49 where invoice_id=105 and product_stock_id=97;
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,10,10643.106,100,3);
update invoicedetails set quantity=15,price_each=43.49 where invoice_id=114 and product_stock_id=97;
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,114,1041.50,68,6);
update invoicedetails set quantity=2,price_each=39.90 where invoice_id=241 and product_stock_id=97;
update invoicedetails set product_stock_id=96 where invoice_id=114 and product_stock_id != 97;
update invoicedetails set quantity=2, price_each=43.49 where invoice_id=20 and product_stock_id=97;
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,20,1041.50,4,3);
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,151,1041.50,4,3);
update invoicedetails set quantity=2,price_each=43.49 where invoice_id=151 and product_stock_id=97;
update invoicedetails set quantity=2,price_each=43.49 where invoice_id=162 and product_stock_id=97;
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,162,1041.50,4,4);
update invoicedetails set quantity=2,price_each=43.49 where invoice_id=311 and product_stock_id=97;
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,311,1041.50,18,4);
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,377,1093.60,132,12);
update invoicedetails set quantity=2,price_each=52.20 where invoice_id=377 and product_stock_id=97;
update invoicedetails set quantity=2,price_each=43.49 where invoice_id=127 and product_stock_id=97;
update invoicedetails set price_each=52.20 where invoice_id=372 and product_stock_id=97;
insert into invoicedetails(version, invoice_id,price_each,product_stock_id,quantity) values(0,127,95.85,79,4);
alter table product_stock drop price_each;
alter table product_stock drop quantity;
alter table product_stock drop purchase_id;
alter table product_stock drop sold;