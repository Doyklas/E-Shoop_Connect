-- 1. Selecione todos os nomes e números de telefone dos usuários.
select name, phoneNumber from users;
--
-- 2. Liste os nomes dos compradores.
select pk_userId from buyer; -- consulta tabela buyers
select name, phoneNumber
from users
where pk_userId IN(select pk_userId from buyer);
--
-- 3. Liste os nomes dos vendedores.
select pk_userId from seller; -- consulta tabela seller
select name, phonenumber
from users
where pk_userId IN(select pk_userId from seller);
--
-- 4. Encontre todas as informações de cartão de crédito dos usuários.
select 
	b.pk_cardNUmber, 
	b.expiryDate, 
	b.bank,
	c.fk_userId,
	c.organization
from bankcard as b
inner join creditcard as c 
on b.pk_cardNumber = c.pk_cardNumber;
--
-- 5. Selecione os nomes dos produtos e seus preços.
select 
	name, 
    price 
from product;
-- 
-- 6. Liste todos os produtos de uma determinada marca (por exemplo, "Samsung").
select 
	fk_brand, 
	name, 
    color 
from product 
where fk_brand in("Samsung");

select 
	fk_brand,
    name, 
    color, 
    type 
from product 
where fk_brand in("Microsoft");
--
-- 7. Encontre o número de itens em cada pedido.
select 
	pk_orderNumber as pedidos, 
	SUM(quantity)  as quantidade
from contain
GROUP BY  pk_orderNumber;
--
-- 8. Calcule o total de vendas por loja.

select 
	s.name as loja,
    SUM(o.price) as valor_total
from store as s
join  product as p on s.pk_sid = p.fk_sid
join orderItem as o on p.pk_pid = o.fk_pid
GROUP BY loja;

--
-- 9. Liste as avaliações dos produtos (grade) com seus nomes e conteúdo de usuário.
-- 
-- 10.Selecione os nomes dos compradores que fizeram pedidos.
-- 11.Encontre os vendedores que gerenciam várias lojas.
-- 12.Liste os nomes das lojas que oferecem produtos de uma determinada marca (por exemplo, "Apple").
-- 13.Encontre as informações de entrega de um pedido específico (por exemplo, orderNumber = 123).
-- 14.Calcule o valor médio das compras dos compradores.
-- 15.Liste as marcas que têm pontos de serviço em uma determinada cidade(por exemplo, "Nova York").
-- 16.Encontre o nome e o endereço das lojas com uma classificação de cliente superior a 4.
-- 17.Liste os produtos com estoque esgotado.
-- 18.Encontre os produtos mais caros em cada marca.
-- 19.Calcule o total de pedidos em que um determinado cartão de crédito (por exemplo, cardNumber = '1234567890') foi usado.
-- 20.Liste os nomes e números de telefone dos usuários que não fizerampedidos.
-- 21.Liste os nomes dos produtos que foram revisados por compradores com uma classificação superior a 4.
-- 22.Encontre os nomes dos vendedores que não gerenciam nenhuma loja.
-- 23.Liste os nomes dos compradores que fizeram pelo menos 3 pedidos.
-- 24.Encontre o total de pedidos pagos com cartão de crédito versus cartão dedébito.
-- 25.Liste as marcas (brandName) que não têm produtos na loja com ID 1.
-- 26.Calcule a quantidade média de produtos disponíveis em todas as lojas.
-- 27.Encontre os nomes das lojas que não têm produtos em estoque (amount = 0).
-- 28.Liste os nomes dos vendedores que gerenciam uma loja localizada em "São Paulo".
-- 29.Encontre o número total de produtos de uma marca específica (por exemplo, "Sony") disponíveis em todas as lojas.
-- 30.Calcule o valor total de todas as compras feitas por um comprador específico (por exemplo, userid = 1).