-- Liste a quantidade de produtos em cada categoria, ordenados pela quantidade em ordem decrescente

SELECT Categorias.nome, COUNT(Produtos.id) AS quantidade_produtos
    FROM Produtos
    INNER JOIN Categorias ON Produtos.categoria_id = Categorias.id
    GROUP BY Categorias.nome
    ORDER BY quantidade_produtos DESC;