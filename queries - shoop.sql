-- 1. Faça a inserção de dados nas tabelas, utilize o arquivo inserts.sql para incluir essas informações nas tabelas;

-- 2.Crie visualizações (views) para fazer o seguinte:
-- a Consultar todos os produtos existentes na loja;
select 	p.type,
		s.name as loja
from product AS p
join store as s;
--
-- b Consultar os nomes de todos os usuários;
select name from users;
--
-- c Consultar as lojas que vendem produtos;
select
        s.pk_sid,
        s.name
from product as p
join store as s on p.fk_sid = s.pk_sid;
-- d Consultar os endereços relacionando com os clientes;
select
        b.pk_userid,
        a.streetaddr
from buyer as b
join address as a on b.pk_userid = a.fk_userid;
--
-- e Consultar todos os produtos do tipo laptop;
select
	name,
    type
from product 
where  type = "laptop";
--
-- f Consultar o endereço, hora de inicio (start time) e hora final (end time) dos pontos de serviço da
-- mesma cidade que o usuário cujo ID é 5.
select 
	s.streetaddr 	as Endereco,
    s.starttime  	as Inicio,
    s.endtime		as Final
from users 			as u
join comments 		as c on u.pk_userid = c.fk_userid
join product 		as p on c.fk_pid = p.pk_pid
join brand 			as b on b.pk_brandname = p.fk_brand
join after_sales_service_at as a on a.fk_brandname = b.pK_brandname
join servicepoint 	as s on s.pk_spid = a.fk_spid
where u.pk_userid = 5;
--
-- g Consultar a quantidade total de produtos que foram colocados no carrinho (shopping cart),
-- considerando a loja com ID (sid) igual a 8.
select 
	s.pk_sid as Loja,
    p.pk_pid as Produto,
    sum(quantity) as QTDE
    
from product as p
join Save_to_Shopping_Cart as save on p.pk_pid = save.pk_pid
join store as s  on p.fk_sid = s.pk_sid
where s.pk_sid = 8
group by Produto;
--
-- h Consultar os comentários do produto 123456789.
select 
	c.content
from comments as c
join product as p on p.pk_pid = c.fk_pid
where p.pk_pid = 123456789;