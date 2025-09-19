# Perguntas para Consultas SQL - Oficina Mecânica

## Recuperações simples com SELECT Statement

1. Quais são todos os clientes cadastrados no sistema?
2. Liste todos os veículos registrados na oficina.
3. Mostre todas as ordens de serviço abertas.
4. Quais são todos os mecânicos cadastrados?
5. Liste todos os serviços disponíveis na oficina.

## Filtros com WHERE Statement

6. Quais clientes moram em São Paulo?
7. Liste todos os veículos da marca Volkswagen.
8. Mostre as ordens de serviço com status "em andamento".
9. Quais peças estão com estoque abaixo de 10 unidades?
10. Liste os mecânicos contratados após 01/01/2020.

## Expressões para gerar atributos derivados

11. Qual é o valor total de cada ordem de serviço (considerando serviços e peças)?
12. Mostre o nome das peças e seus preços com um desconto de 15%.
13. Liste os clientes com sua idade calculada a partir da data de nascimento.
14. Qual o valor total de cada ordem com acréscimo de mão de obra de R$ 50,00?
15. Mostre os serviços com seu preço em dólares (considerando 1 dólar = R$ 5,00).

## Ordenações dos dados com ORDER BY

16. Liste todos os serviços ordenados por preço, do mais caro ao mais barato.
17. Mostre os clientes ordenados por data de cadastro, do mais recente ao mais antigo.
18. Liste as ordens de serviço ordenadas por valor total, da maior para a menor.
19. Quais peças estão ordenadas alfabeticamente por nome?
20. Mostre as ordens de serviço ordenadas por data de abertura, da mais antiga à mais recente.

## Condições de filtros aos grupos – HAVING Statement

21. Quais mecânicos atenderam mais de 2 ordens de serviço?
22. Liste os clientes que possuem mais de 1 veículo cadastrado.
23. Quais peças têm estoque médio maior que 15 unidades por fornecedor?
24. Mostre as especialidades de mecânicos cujo salário médio é superior a R$ 3.000,00.
25. Liste as marcas de veículos que possuem mais de 1 veículo cadastrado.

## Junções entre tabelas para perspectiva complexa dos dados

26. Quantas ordens de serviço foram feitas por cada cliente? (JOIN entre clientes e veículos e ordens)
27. Qual o valor total gasto por cada cliente em todos os serviços? (JOIN múltipla)
28. Liste os veículos e seus respectivos proprietários (clientes).
29. Mostre as ordens de serviço com seus respectivos mecânicos e veículos atendidos.
30. Qual a quantidade total de peças utilizadas em cada ordem de serviço?
31. Liste os mecânicos e as ordens de serviço que eles atenderam com os serviços realizados.
32. Qual o ticket médio das ordens de serviço por mecânico?
33. Mostre as peças que nunca foram utilizadas em ordens de serviço.
34. Liste os clientes que fizeram serviços de uma determinada especialidade (ex: Motor).
35. Qual o serviço mais realizado na oficina?