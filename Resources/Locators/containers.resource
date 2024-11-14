*** Variables ***
#Products
${PRODUCTS}                xpath://div[@class='product']
${Product_info}            xpath://h4 | //p[@class='product-price']
${CART CONTAINER}          xpath://div[@class='cart-preview active']
${product_info_container}  xpath://div[@class='cart-preview active']//div//div//p[@class='product-name'] | //div[@class='cart-preview active']//div//div//p[@class='quantity'] | //div[@class='cart-preview active']//div//div//p[@class='product-price'] | //div[@class='cart-preview active']//div//div//p[@class='amount']
