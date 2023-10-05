-- 1 selecionar todos os produtos
-- 2 selecionar o nome de todos os ususarios
-- 3 - Retornar todos os conteúdos dos comentários dos produto
-- 4 - Qual endereço do usuário cujo id é igual a 21?
-- 5 - Qual o endereço da loja cujo id 39?
-- 6 - Os pedidos com id 74892932 e 84821231 foram pagos?

-- 1 selecionar todos os produtos:
select * from product;
select name from product; 
--
-- 2 selecionar o nome de todos os ususarios
select name from users;
--
-- 3 - Retornar todos os conteúdos dos comentários dos produto
select content from comments;
--
-- 4 - Qual endereço do usuário cujo id é igual a 21?
select streetaddr  from address where fk_userid = 21;
--
-- 5 - Qual o endereço da loja cujo id 39?
select streetaddr  from store where pk_sid = 39;
--
-- 6 - Os pedidos com id 74892932 e 84821231 foram pagos?
select payTime from payment where fk_orderNumber = 74892932;
select payTime from payment where fk_orderNumber = 84821231;
--