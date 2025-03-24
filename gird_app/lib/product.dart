class Product {
  String pic;
  String name;
  String price;
  Product({required this.pic, required this.name, required this.price});
  static List<Product> productList = [
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/Sc3451598a1874b6880319b78a2919806H.jpg_200x200q80.jpg_.webp",
      name: "Balmain Slippers Slippers for men",
      price: "Rs. 2000",
    ),
    Product(
      pic:
          "http://img.drz.lazcdn.com/static/pk/p/fd0be1f69478a0bab7e83843ab6856f2.png_200x200q80.png_.webp",
      name:
          "Transparent Lightweight Anti Glare UV Eyeglasses For Men and Women White Glasses for Boys and Girls",
      price: "Rs. 230",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/S76844444118846d3a4015301c5b088f8R.jpg_200x200q80.jpg_.webp",
      name:
          "Hair Straightener Brush Curling Comb 2 In 1 Hair Hot Comb Anti-Scald Hair Straightener Brush For Girls",
      price: "Rs. 970",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/Sdb918aabb5e04c1695c1f14b838cd90d7.jpg_400x400q80.jpg",
      name:
          "Fashion Mens Dainty Stainless Steel Watches Luxury Silver Quartz Wristwatch Men Business Casual Watch",
      price: "Rs. 941",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/S76844444118846d3a4015301c5b088f8R.jpg_200x200q80.jpg_.webp",
      name: "SHADY SHIRTS FOR MEN",
      price: "Rs. 1299",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/Sc3451598a1874b6880319b78a2919806H.jpg_200x200q80.jpg_.webp",
      name: "Balmain Slippers Slippers for men",
      price: "Rs. 2000",
    ),
    Product(
      pic:
          "http://img.drz.lazcdn.com/static/pk/p/fd0be1f69478a0bab7e83843ab6856f2.png_200x200q80.png_.webp",
      name:
          "Transparent Lightweight Anti Glare UV Eyeglasses For Men and Women White Glasses for Boys and Girls",
      price: "Rs. 230",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/S76844444118846d3a4015301c5b088f8R.jpg_200x200q80.jpg_.webp",
      name:
          "Hair Straightener Brush Curling Comb 2 In 1 Hair Hot Comb Anti-Scald Hair Straightener Brush For Girls",
      price: "Rs. 970",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/Sdb918aabb5e04c1695c1f14b838cd90d7.jpg_400x400q80.jpg",
      name:
          "Fashion Mens Dainty Stainless Steel Watches Luxury Silver Quartz Wristwatch Men Business Casual Watch",
      price: "Rs. 941",
    ),
    Product(
      pic:
          "https://img.drz.lazcdn.com/g/kf/S76844444118846d3a4015301c5b088f8R.jpg_200x200q80.jpg_.webp",
      name: "SHADY SHIRTS FOR MEN",
      price: "Rs. 1299",
    ),
  ];

  // <<<<<<<<<<<<<<< ADD TO CART LIST <<<<<<<<<<<<<<<<<<<

  static List<Product> cartList = [];

  ///<<<<<<<<<<<<<<<<  count notifications <<<<<<<<<<<<<<<
  static int cartListLength = 1;
}
