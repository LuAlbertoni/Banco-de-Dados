# Lista de Exercícios sobre Views e Triggers

Este projeto consiste na criação de um banco de dados chamado "fatec_vendas" e na implementação de exercícios práticos envolvendo views e triggers em um banco de dados MariaDB.

## Estrutura do Banco de Dados

Crie o banco de dados com as seguintes tabelas e seus respectivos campos:
- **categorias** (id, categoria)
- **produtos** (id, descrição, estoque, preço_unitario, categoria)
- **vendas** (id, cliente_id, numero_nota, data_venda, total_venda)
- **itens_vendas** (venda_id, produto_id, quantidade, preco_unitario)
- **clientes** (id, nome, email, telefone, status)
- **auditoria_precos** (produto_id, preco_anterior, novo_preco, data_alteracao)

## Exercícios Práticos sobre Views

1. **View: vendas_2023**
   - Crie uma view chamada `vendas_2023` que contenha todas as vendas realizadas em 2023.

2. **View: produtos_disponiveis**
   - Crie uma view chamada `produtos_disponiveis` que contenha todos os produtos com estoque disponível.

3. **View: top_clientes**
   - Crie uma view chamada `top_clientes` que contenha os clientes com maior valor de compras.

4. **View: vendas_recentes**
   - Crie uma view chamada `vendas_recentes` que contenha todas as vendas realizadas nos últimos 30 dias.

5. **View: clientes_ativos**
   - Crie uma view chamada `clientes_ativos` que contenha todos os clientes com status "ativo".

## Exercícios Práticos sobre Triggers

6. **Trigger: Atualizar Estoque**
   - Crie um trigger que seja acionado após a inserção de um produto em uma nova venda na tabela `itens_vendas`, que atualize automaticamente o estoque do produto vendido na tabela `produtos`.

7. **Trigger: Verificar Vendas Antes da Exclusão de Cliente**
   - Crie um trigger que seja acionado antes da exclusão de um cliente na tabela `clientes`, que verifique se o cliente possui alguma venda registrada na tabela `vendas`. Se sim, a exclusão do cliente deve ser impedida.

8. **Trigger: Registrar Alteração de Preço**
   - Crie um trigger que seja acionado após a atualização do preço de um produto na tabela `produtos`, que registre a alteração em uma tabela de auditoria chamada `auditoria_precos`.

9. **Trigger: Atualizar Status do Cliente**
   - Crie um trigger que seja acionado após a inserção de uma nova venda na tabela `vendas`, que atualize o status do cliente associado na tabela `clientes` para "ativo", caso o cliente esteja com o status “inativo”.

10. **Trigger: Reatribuir Categoria de Produtos**
    - Crie um trigger que seja acionado após a exclusão de uma categoria na tabela `categorias`, que atribua a categoria "Outros" para todos os produtos que pertenciam à categoria excluída, na tabela `produtos`.