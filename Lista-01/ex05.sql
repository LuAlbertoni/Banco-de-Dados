-- Liste todos os produtos e suas categorias, incluindo produtos sem categoria (LEFT JOIN)

SELECT Produtos.nome, Categorias.nome
    FROM Produtos
    LEFT JOIN Categorias ON Produtos.categoria_id = Categorias.id;