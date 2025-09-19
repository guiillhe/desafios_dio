# Respostas SQL para as perguntas do E-commerce

## Recuperações simples com SELECT Statement

1. Quais são todos os clientes cadastrados no sistema?
```sql
SELECT * FROM clientes;
```

2. Liste todos os produtos disponíveis na loja.
```sql
SELECT * FROM produtos WHERE ativo = TRUE;
```

3. Mostre todos os pedidos realizados.
```sql
SELECT * FROM pedidos;
```

4. Quais são todas as categorias de produtos existentes?
```sql
SELECT * FROM categorias;
```

5. Liste todos os itens de pedidos já registrados.
```sql
SELECT * FROM itens_pedido;
```

## Filtros com WHERE Statement

6. Quais clientes moram em São Paulo?
```sql
SELECT * FROM clientes WHERE estado = 'SP';
```

7. Liste todos os produtos com preço superior a R$ 100,00.
```sql
SELECT * FROM produtos WHERE preco > 100.00;
```

8. Mostre os pedidos com status "pendente".
```sql
SELECT * FROM pedidos WHERE status_pedido = 'pendente';
```

9. Quais produtos estão com estoque abaixo de 10 unidades?
```sql
SELECT * FROM produtos WHERE estoque < 10;
```

10. Liste os clientes que se cadastraram após 01/01/2023.
```sql
SELECT * FROM clientes WHERE data_cadastro > '2023-01-01';
```

## Expressões para gerar atributos derivados

11. Qual é o valor total de cada pedido (considerando quantidade * preço unitário)?
```sql
SELECT p.id_pedido, SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM pedidos p
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido;
```

12. Mostre o nome dos produtos e seus preços com um desconto de 10%.
```sql
SELECT nome_produto, preco, (preco * 0.9) AS preco_com_desconto
FROM produtos;
```

13. Liste os clientes com sua idade calculada a partir da data de nascimento.
```sql
SELECT nome, data_nascimento, 
       TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM clientes;
```

14. Qual o valor total de cada pedido com acréscimo de frete de R$ 15,00?
```sql
SELECT p.id_pedido, 
       SUM(ip.quantidade * ip.preco_unitario) AS valor_produtos,
       (SUM(ip.quantidade * ip.preco_unitario) + 15.00) AS valor_total_com_frete
FROM pedidos p
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido;
```

15. Mostre os produtos com seu preço em dólares (considerando 1 dólar = R$ 5,00).
```sql
SELECT nome_produto, preco, (preco / 5.00) AS preco_dolar
FROM produtos;
```

## Ordenações dos dados com ORDER BY

16. Liste todos os produtos ordenados por preço, do mais caro ao mais barato.
```sql
SELECT * FROM produtos ORDER BY preco DESC;
```

17. Mostre os clientes ordenados por data de cadastro, do mais recente ao mais antigo.
```sql
SELECT * FROM clientes ORDER BY data_cadastro DESC;
```

18. Liste os pedidos ordenados por valor total, do maior para o menor.
```sql
SELECT p.id_pedido, SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM pedidos p
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido
ORDER BY valor_total DESC;
```

19. Quais produtos estão ordenados alfabeticamente por nome?
```sql
SELECT * FROM produtos ORDER BY nome_produto ASC;
```

20. Mostre os pedidos ordenados por data, do mais antigo ao mais recente.
```sql
SELECT * FROM pedidos ORDER BY data_pedido ASC;
```

## Condições de filtros aos grupos – HAVING Statement

21. Quais categorias têm mais de 2 produtos cadastrados?
```sql
SELECT c.nome_categoria, COUNT(p.id_produto) AS qtd_produtos
FROM categorias c
JOIN produtos p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria
HAVING COUNT(p.id_produto) > 2;
```

22. Liste os clientes que fizeram mais de 1 pedido.
```sql
SELECT c.nome, COUNT(p.id_pedido) AS qtd_pedidos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(p.id_pedido) > 1;
```

23. Quais produtos têm estoque médio maior que 30 unidades por categoria?
```sql
SELECT c.nome_categoria, AVG(p.estoque) AS estoque_medio
FROM categorias c
JOIN produtos p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria
HAVING AVG(p.estoque) > 30;
```

24. Mostre as categorias cujo preço médio dos produtos é superior a R$ 100,00.
```sql
SELECT c.nome_categoria, AVG(p.preco) AS preco_medio
FROM categorias c
JOIN produtos p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria
HAVING AVG(p.preco) > 100.00;
```

25. Liste os estados que possuem mais de 1 cliente cadastrado.
```sql
SELECT estado, COUNT(*) AS qtd_clientes
FROM clientes
GROUP BY estado
HAVING COUNT(*) > 1;
```

## Junções entre tabelas para perspectiva complexa dos dados

26. Quantos pedidos foram feitos por cada cliente? (JOIN entre clientes e pedidos)
```sql
SELECT c.nome, COUNT(p.id_pedido) AS qtd_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;
```

27. Qual o valor total gasto por cada cliente em todos os pedidos? (JOIN múltipla)
```sql
SELECT c.nome, COALESCE(SUM(ip.quantidade * ip.preco_unitario), 0) AS valor_total_gasto
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
LEFT JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY c.id_cliente;
```

28. Liste os produtos e suas respectivas categorias.
```sql
SELECT p.nome_produto, c.nome_categoria
FROM produtos p
JOIN categorias c ON p.id_categoria = c.id_categoria;
```

29. Mostre os pedidos com seus respectivos itens e produtos (nome do produto).
```sql
SELECT p.id_pedido, pr.nome_produto, ip.quantidade, ip.preco_unitario
FROM pedidos p
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto;
```

30. Qual a quantidade total vendida de cada produto?
```sql
SELECT pr.nome_produto, SUM(ip.quantidade) AS qtd_total_vendida
FROM produtos pr
LEFT JOIN itens_pedido ip ON pr.id_produto = ip.id_produto
GROUP BY pr.id_produto;
```

31. Liste os clientes e seus pedidos com os produtos comprados.
```sql
SELECT c.nome AS cliente, p.id_pedido, pr.nome_produto, ip.quantidade
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto
ORDER BY c.nome, p.id_pedido;
```

32. Qual o ticket médio dos pedidos por cliente?
```sql
SELECT c.nome, 
       COALESCE(AVG(valor_pedido.valor), 0) AS ticket_medio
FROM clientes c
LEFT JOIN (
    SELECT p.id_cliente, p.id_pedido, SUM(ip.quantidade * ip.preco_unitario) AS valor
    FROM pedidos p
    JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
    GROUP BY p.id_pedido
) AS valor_pedido ON c.id_cliente = valor_pedido.id_cliente
GROUP BY c.id_cliente;
```

33. Mostre os produtos que nunca foram vendidos.
```sql
SELECT p.nome_produto
FROM produtos p
LEFT JOIN itens_pedido ip ON p.id_produto = ip.id_produto
WHERE ip.id_produto IS NULL;
```

34. Liste os clientes que compraram produtos de uma determinada categoria (ex: Eletrônicos).
```sql
SELECT DISTINCT c.nome
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto
JOIN categorias cat ON pr.id_categoria = cat.id_categoria
WHERE cat.nome_categoria = 'Eletrônicos';
```

35. Qual o produto mais vendido por categoria?
```sql
SELECT c.nome_categoria, pr.nome_produto, SUM(ip.quantidade) AS qtd_vendida
FROM categorias c
JOIN produtos pr ON c.id_categoria = pr.id_categoria
JOIN itens_pedido ip ON pr.id_produto = ip.id_produto
GROUP BY c.id_categoria, pr.id_produto
HAVING SUM(ip.quantidade) = (
    SELECT MAX(qtd_vendida)
    FROM (
        SELECT SUM(ip2.quantidade) AS qtd_vendida
        FROM produtos pr2
        JOIN itens_pedido ip2 ON pr2.id_produto = ip2.id_produto
        WHERE pr2.id_categoria = c.id_categoria
        GROUP BY pr2.id_produto
    ) AS subquery
);