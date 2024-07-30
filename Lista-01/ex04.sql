-- Liste todos os produtos junto com suas categorias usando INNER JOIN

SELECT Produtos.nome, Categorias.nome
    FROM Produtos
    INNER JOIN Categorias ON Produtos.categoria_id = Categorias.id;