import 'package:api_auth_flutter/data/models/user_models.dart';
import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/pages/users%20page/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Api().getUsers(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 117, 117, 120),
                ),
              );
            } else {
              List<UserModel> users = snapShot.data;
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                 childAspectRatio:
                      ((context.getWidth() / 2.2) / (context.getHeight() / 4)),
                crossAxisCount: 2,
                children: <Widget>[
                  ...List.generate(
                    users.length,
                    (index) {
                      var user = users[index];
                      return UsersCard(
                        image: user.avatar!,
                        name: user.name!,
                        email: user.email!,
                      );
                    },
                  )
                ],
              );
            }
          }),
    );
  }
}
