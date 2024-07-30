-- Liste os produtos cujo preço é maior que a média dos preços de todos os produtos.

SELECT * FROM Produtos
    WHERE preco > (SELECT AVG(preco) FROM Produtos);