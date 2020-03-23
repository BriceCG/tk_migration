 CREATE OR REPLACE FUNCTION get_sequence(nom Text)  Returns integer as
$$
DECLARE 
	nom_sequence VARCHAR(512);
	max_id Integer;
	req VARCHAR(512) ;
	req1 VARCHAR(512) ;
	req2 VARCHAR(512);
	req3 TEXT ;
	req4 TEXT ;
	a int ; 
BEGIN
		req3 := 'SELECT count(*) FROM '|| nom ;
		EXECUTE req3 INTO a ;
		
		if a >0 THEN
			req := 'SELECT max(id) FROM '|| nom ;
			EXECUTE  req INTO max_id ; 
				
			req1 := ' SELECT pg_get_serial_sequence(''' || nom || ''',''id'')'    ;
			EXECUTE req1 INTO nom_sequence ; 
			
			--Select * from nom_sequence ;
			req2 := ' ALTER SEQUENCE '  || nom_sequence || ' RESTART WITH ' || max_id + 1;
			EXECUTE req2  ;
			Return 1;
		ELSE
			return -1 ;	
		END IF;
	

END ;
$$
LANGUAGE 'plpgsql' ; 

select * from get_sequence('sale_order');
select * from get_sequence('sale_order_line');
select * from get_sequence('sale_order_delete');
select * from get_sequence('res_users');
select * from get_sequence('res_partner');
select * from get_sequence('res_company');
select * from get_sequence('stock_move');
select * from get_sequence('stock_inventory');
select * from get_sequence('stock_inventory_line');
select * from get_sequence('stock_move_component_line');
select * from get_sequence('stock_move_accessory_line');
select * from get_sequence('stock_production_lot');
select * from get_sequence('stock_picking');
select * from get_sequence('procurement_group');
select * from get_sequence('uom_uom');
select * from get_sequence('uom_category');
select * from get_sequence('mrp_configuration');
select * from get_sequence('mrp_bom');
select * from get_sequence('mrp_bom_line');
select * from get_sequence('mrp_component');
select * from get_sequence('mrp_production');
select * from get_sequence('mrp_sub_component');
select * from get_sequence('product_category');
select * from get_sequence('account_move_line');
select * from get_sequence('account_move');
select * from get_sequence('account_journal');
select * from get_sequence('product_template');
select * from get_sequence('product_product');
select * from get_sequence('purchase_order');
select * from get_sequence('ir_ui_view_custom');
select * from get_sequence('account_payment');
select * from get_sequence('hr_employee');
select * from get_sequence('crm_claim');
select * from get_sequence('article_categorie');
select * from get_sequence('mim_article');
select * from get_sequence('mail_followers');
select * from get_sequence('mail_message');
select * from get_sequence('account_invoice_line');
select * from get_sequence('ir_module_category');

insert into res_groups_users_rel (gid,uid) select distinct 1, uid from res_groups_users_rel where uid>3;
insert into res_groups_users_rel (gid,uid) select distinct 32, uid from res_groups_users_rel where uid=30 or uid=73 or uid=20;
insert into res_groups_users_rel (gid,uid) select distinct 36, uid from res_groups_users_rel where uid=30 or uid=73 or uid=20;
insert into res_groups_users_rel (gid,uid) select distinct 40, uid from res_groups_users_rel where uid=30 or uid=73 or uid=20;
insert into res_groups_users_rel (gid,uid) select distinct 18, uid from res_groups_users_rel where uid=30 or uid=73 or uid=20;
insert into res_groups_users_rel (gid,uid) select distinct 33, uid from res_groups_users_rel where uid=30 or uid=73 or uid=20;
insert into res_groups_users_rel (gid,uid) select distinct 19, uid from res_groups_users_rel where uid>3;
insert into res_groups_users_rel (gid,uid) select distinct 24, uid from res_groups_users_rel where uid>3;
delete from ir_ui_view where id=148;
delete from mail_message where model like '%mail.group%';
update res_users set partner_id=9 where id=2
update product_pricelist set currency_id = 105 where id = 2
