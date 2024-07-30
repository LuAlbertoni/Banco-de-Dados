-- Liste a quantidade de produtos em cada categoria

SELECT Categorias.nome, COUNT(Produtos.id) AS quantidade_produtos
    FROM Produtos
    INNER JOIN Categorias ON Produtos.categoria_id = Categorias.id
    GROUP BY Categorias.nome;
