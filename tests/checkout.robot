# Feature: Carrinho de compras

#   Scenario: Adicionar produtos e verificar quantidade
#     Given que o usuário acessa a página de produtos
#     When adiciona dois produtos ao carrinho
#     And acessa o carrinho
#     Then deve ver os produtos adicionados com a quantidade correta

# Feature: Finalização de compra

#   Scenario: Finalizar compra e baixar fatura
#     Given que o usuário está logado e tem produtos no carrinho
#     When acessa o carrinho e clica em "Proceed to Checkout"
#     And preenche os dados de pagamento
#     And clica em "Place Order"
#     Then deve ver a mensagem "Order Placed Successfully!"
#     And pode baixar a fatura em PDF

# Feature: Busca de produtos e persistência de carrinho

#   Scenario: Buscar produto e verificar carrinho após login
#     Given que o usuário acessa o site
#     When busca por "T-Shirt"
#     And adiciona o produto ao carrinho
#     And realiza login
#     Then o produto deve continuar no carrinho após o login
