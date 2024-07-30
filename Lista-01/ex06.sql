-- Liste todas as categorias e seus produtos, incluindo categorias sem produtos (RIGHT JOIN)

SELECT Produtos.nome, Categorias.nome
    FROM Produtos
    RIGHT JOIN Categorias ON Produtos.categoria_id = Categorias.id;