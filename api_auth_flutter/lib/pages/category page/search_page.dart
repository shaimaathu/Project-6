import 'package:api_auth_flutter/data/models/categories_model.dart';
import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/pages/category%20page/widgets/category_card.dart';
import 'package:api_auth_flutter/pages/category%20page/widgets/floating_button_category_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Categories",
          style: TextStyle(fontSize: 25, color: icons),
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder(
              future: Api().getCategories(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 117, 117, 120),
                    ),
                  );
                } else {
                  List<Category> categoriesData = snapShot.data;
                  return GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      ...List.generate(
                        categoriesData.length,
                        (index) {
                          var categoryOne = categoriesData[index];
                          return CategoryCard(
                            image: categoryOne.image,
                            name: categoryOne.name,
                          );
                        },
                      )
                    ],
                  );
                }
              }),
        ],
      ),
      floatingActionButton: ButtonCategoryWidgets(),
    );
  }
}
