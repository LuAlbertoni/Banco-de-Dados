-- Liste as categorias que têm mais de 10 produtos

SELECT Categorias.nome, COUNT(Produtos.id) AS quantidade_produtos
    FROM Produtos
    INNER JOIN Categorias ON Produtos.categoria_id = Categorias.id
    GROUP BY Categorias.nome
    HAVING COUNT(Produtos.id) > 10;