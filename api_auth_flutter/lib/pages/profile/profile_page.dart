import 'package:api_auth_flutter/data/data_layer.dart';
import 'package:api_auth_flutter/data/models/user_models.dart';
import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/pages/profile/widgets/profile_widgets.dart';
import 'package:api_auth_flutter/pages/users%20page/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin =
        GetIt.I.get<AllData>().user.role!.toLowerCase() == "admin".toLowerCase()
            ? true
            : false;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 25, color: icons),
          ),
          actions: [
            Visibility(
              visible: isAdmin,
              child: TextButton(
                onPressed: () {
                  context.pushTo(view: const UsersPage());
                },
                child: Text("All users",
                    style: TextStyle(fontSize: 20, color: icon)),
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: context.getHeight() / 3,
          width: context.getWidth() * 0.90,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: product, borderRadius: BorderRadius.circular(20)),
          child: FutureBuilder(
              future: Api().getProfile(token: GetIt.I.get<AllData>().auth),
              builder: (context, snapShot) {
                final UserModel profile = snapShot.data;
                return Profile(
                  image: profile.avatar!,
                  name: profile.name!,
                  email: profile.email!,
                );
              }),
        ));
  }
}
