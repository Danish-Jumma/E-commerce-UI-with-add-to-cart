import 'package:flutter/material.dart';
import 'package:gird_app/add_cart_view.dart';
import 'package:gird_app/product.dart';

void main() {
  runApp(const CartListView());
}

class CartListView extends StatefulWidget {
  const CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    // product data from product class
    List<Product> cart = Product.cartList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Cart List", style: TextStyle(color: Colors.white)),
      ),
      body:
          (cart.isNotEmpty)
              ? ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddToCardView(),
                          settings: RouteSettings(
                            arguments: {
                              "img": cart[index].pic,
                              "name": cart[index].name,
                              "price": cart[index].price,
                            },
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      // product image
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image(
                            image: NetworkImage(cart[index].pic),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // product price
                      title: Text(
                        "Rs. ${cart[index].price}",
                        style: TextStyle(color: Colors.pink),
                      ),
                      // product description
                      subtitle: Text(
                        cart[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // delete product from cart list
                      trailing: IconButton(
                        // delete cart item from cart list functionality
                        onPressed: () {
                          setState(() {
                            Product.cartList.removeAt(index);
                            // Product.cartListLength = 1;
                            print(Product.cartList);
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.pink),
                      ),
                    ),
                  );
                },
              )
              : Center(child: Text("No products added")),
    );
  }
}
