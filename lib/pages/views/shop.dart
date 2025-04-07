import 'package:flutter/material.dart';
import 'package:antonio_m5a1/data/notifier.dart';

void main() {
  runApp(ShopView());
}

class Product {
  final String productName;
  final double price;
  final String image;

  Product(
      {required this.productName, required this.price, required this.image});
}

class ShopView extends StatelessWidget {
  ShopView({super.key});
  final List<Product> products = [
    Product(
        productName: 'Backpack', price: 1750.00, image: "assets/backpack.jpg"),
    Product(
        productName: 'Electric Fan',
        price: 3500.00,
        image: "assets/electric_fan.jpg"),
    Product(productName: 'Guitar', price: 1200.00, image: "assets/guitar.jpg"),
    Product(productName: 'Sofa', price: 12500.00, image: "assets/sofa.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: !isDarkMode
                ? const Color.fromARGB(255, 59, 57, 57)
                : const Color.fromARGB(255, 230, 224, 224),
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 350,
                      width: 200,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                height: 115,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  shape: BoxShape.rectangle,
                                  color: Colors.black,
                                  image: DecorationImage(
                                    image: AssetImage(product.image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(product.productName,
                                  style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text(
                                "PHP ${product.price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 40),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(100, 60),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15)),
                                  child: Text("Buy Now",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ))),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
