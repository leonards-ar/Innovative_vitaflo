update product_stock set lot=upper(lot) where lot is not null;
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, id,0 from product_stock where lot in (select lot from product_stock group by lot having count(*) = 1);
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 1,0 from product_stock where lot='22012A';
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
insert into purchasedetails(price_each, quantity,purchase_id, product_stock_id,version) select price_each, quantity, purchase_id, 151,0 from product_stock where lot='30324';
delete from product_stock where id in (11,23,95,135,77,101,10,136,88,121,84,119,78,128,125,105,113,140,143,154,14,45,80,152,157);
insert into invoicedetails (version,invoice_id,price_each,product_stock_id,quantity) select 0 version,i.id invoice_id,pd.price_each price_each,ps.id product_stock_id, pd.quantity quantity from proformadetails pd, invoices i, product_stock ps where pd.proforma_id=i.proforma_id and pd.lot = ps.lot and ps.id in (select product_stock_id from purchasedetails);
alter table product_stock drop price_each;
alter table product_stock drop quantity;
alter table product_stock drop purchase_id;
alter table product_stock drop sold;