import 'package:flutter/material.dart';
import 'package:gird_app/add_cart_view.dart';
import 'package:gird_app/cart_list_view.dart';
import 'package:gird_app/product.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // proudct list
    List<Product> products = Product.productList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("E-Commerce", style: TextStyle(color: Colors.white)),
        actions: [
          // notification
          // badges.Badge(
          //   badgeContent: Text(
          //     Product.cartList.length.toString(),
          //     style: TextStyle(color: Colors.white, fontSize: 12),
          //   ),
          //   showBadge: Product.cartList.isNotEmpty,
          //   badgeStyle: badges.BadgeStyle(badgeColor: Colors.yellow),
          //   child: IconButton(
          //     // clear notification after on tap
          //     onPressed: () {
          //       setState(() {
          //         // Product.cartList
          //       });
          //     },
          //     icon: Icon(Icons.notifications),
          //   ),
          // ),
          IconButton(
            // notification functionality
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),

          // cart view
          IconButton(
            // cart view functionality
            onPressed: () {
              Navigator.push(
                context,
                (MaterialPageRoute(builder: (context) => CartListView())),
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: Product.productList.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: .7,
        ),
        itemBuilder: (context, index) {
          // product card
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Column(
                children: [
                  // product pic
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      child: Image(
                        image: NetworkImage(products[index].pic),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // product name
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      products[index].name,
                      style: TextStyle(fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // product price
                        Text(
                          products[index].price,
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        // favourite product
                        IconButton(
                          // add favourite functionality
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            // go to card functionality
            onTap: () {
              // product info
              var product = products[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddToCardView(),
                  settings: RouteSettings(
                    arguments: {
                      "img": product.pic,
                      "name": product.name,
                      "price": product.price,
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
