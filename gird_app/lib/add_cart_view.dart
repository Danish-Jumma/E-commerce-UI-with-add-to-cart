import 'package:flutter/material.dart';
import 'package:gird_app/product.dart';

void main() {
  runApp(const AddToCardView());
}

class AddToCardView extends StatefulWidget {
  const AddToCardView({super.key});

  @override
  State<AddToCardView> createState() => _AddToCardViewState();
}

class _AddToCardViewState extends State<AddToCardView> {
  late int originalPrice; // To hold the original product price
  late int updatedPrice; // To hold the updated price after quantity changes
  late Map<String, dynamic> data; // Variable to hold product data

  // Initialize the product details when the widget's dependencies change
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Parse the price data
    originalPrice = int.parse(data["price"].replaceAll(RegExp(r'[^0-9]'), ''));
    updatedPrice =
        originalPrice; // Set the initial updated price as the original price
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Add To Card", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image
            AspectRatio(
              aspectRatio: 16 / 13,
              child: Image(
                image: NetworkImage(data["img"]),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            // Product description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data["name"],
                style: TextStyle(fontSize: 16, wordSpacing: 3),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 20),
              ),
            ),

            // Quantity section
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Qty:",
                  style: TextStyle(fontSize: 20, color: Colors.pink),
                ),
              ),
            ),
            // Add and subtract quantity buttons
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Decrease quantity
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (Product.cartListLength > 1) {
                              Product.cartListLength--;
                              updatedPrice =
                                  originalPrice * Product.cartListLength;
                            }
                          });
                        },
                        child: Text("-", style: TextStyle(fontSize: 40)),
                      ),
                      // Quantity display
                      Text(
                        Product.cartListLength.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      // Increase quantity
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Product.cartListLength++;
                            updatedPrice =
                                originalPrice * Product.cartListLength;
                          });
                        },
                        child: Text("+", style: TextStyle(fontSize: 30)),
                      ),
                    ],
                  ),
                  // Display updated price
                  Text(
                    "Rs. $updatedPrice", // Correct display of updated price
                    style: TextStyle(color: Colors.pink, fontSize: 18),
                  ),
                ],
              ),
            ),

            // Add to cart button
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    // Add product to cart list
                    setState(() {
                      Product.cartList.add(
                        Product(
                          pic: data["img"],
                          name: data["name"],
                          price: updatedPrice.toString(),
                        ),
                      );
                      Product.cartListLength = Product.cartList.length;
                    });
                    // Show product added confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("This product is added to cart."),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),

            // Reviews section
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reviews",
                  style: TextStyle(color: Colors.pink, fontSize: 18),
                ),
              ),
            ),

            // List of reviews
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_82_standard-3.jpg",
                    ),
                  ),
                  title: Text("Alice"),
                  subtitle: Text("Alice reviews about this product..."),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
