import 'package:api_app/base_client.dart';
import 'package:api_app/products_model.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 58, 49, 49),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 75,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
                onPressed: () async {
                  var response =
                      await BaseClient().get("/products").catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful');
                },
                child: const Text("GET")),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
                onPressed: () async {
                  var id = 2;
                  var products = Products(
                      rating: Rating(count: 120, rate: 3.4),
                      title: "Sally ike ",
                      category: "Men's clothing",
                      price: 10,
                      image:
                          "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                      description:
                          "Your perfect pack for everyday use and walks in the \n forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday");
                  var response = await BaseClient()
                      .put("/products/$id", products)
                      .catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful');
                },
                child: const Text("PUT")),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
                onPressed: () async {
                  var products = Products(
                      rating: Rating(count: 120, rate: 3.4),
                      title: "Fjallraven",
                      category: "Female clothing",
                      price: 10,
                      image:
                          "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                      description:
                          "Your perfect pack for everyday use and walks in the \n forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday");
                  var response = await BaseClient()
                      .post("/products", products)
                      .catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful');
                },
                child: const Text("POST")),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
                onPressed: () async {
                  var id = 2;
                  var response = await BaseClient()
                      .delete("/products/$id")
                      .catchError((err) {});
                  if (response == null) return;
                  debugPrint('successful');
                },
                child: const Text("DELETE")),
          ],
        ),
      ),
    );
  }
}
