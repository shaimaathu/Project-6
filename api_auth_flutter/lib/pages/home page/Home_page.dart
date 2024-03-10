import 'package:api_auth_flutter/data/data_layer.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/pages/home%20page/widgets/floating_button_widget.dart';
import 'package:api_auth_flutter/pages/home%20page/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:api_auth_flutter/data/models/prodect_model.dart';
import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin =
        GetIt.I.get<AllData>().user.role!.toLowerCase() == "admin".toLowerCase()
            ? true
            : false;
    return Scaffold(
      body: FutureBuilder(
          future: Api().getProduct(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 117, 117, 120),
                ),
              );
            } else {
              List<ProductsModel> products = snapShot.data;
              return GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(25),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      ((context.getWidth() / 2.2) / (context.getHeight() / 4)),
                  crossAxisCount: 2,
                  children: <Widget>[
                    ...List.generate(products.length, (index) {
                      var product = products[index];
                      String image = product.images![0]
                          .replaceAll(RegExp(r'[\[\]\"]'), '');
                      return ProductCard(
                        image: image,
                        title: product.title!,
                        prise: product.price!,
                      );
                    })
                  ]);
            }
          }),
      floatingActionButton:
          Visibility(visible: isAdmin, child: ButtonWidgets()),
    );
  }
}
