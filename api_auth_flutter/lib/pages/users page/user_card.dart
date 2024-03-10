import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsersCard extends StatelessWidget {
  const UsersCard({
    super.key,
    required this.image,
    required this.name,
    required this.email,
  });
  final String image;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.getHeight() / 2,
        width: context.getWidth(),
        decoration: BoxDecoration(
            color: product, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            gapH10,
            ClipRRect(
              borderRadius: BorderRadius.circular(110),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: context.getHeight() / 8,
                width: context.getWidth() / 4,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3g5oTPvdxNYu1nZliDRHaNqm-Cl5hJt3toQ&usqp=CAU",
                    height: context.getHeight() / 9,
                    width: context.getWidth() / 2.8,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            gapH10,
            Text(
              name,
              style: TextStyle(fontSize: 20, color: icons),
            ),
            gapH10,
            SizedBox(
                width: context.getWidth() / 2,
                child:
                    Text(email, style: TextStyle(fontSize: 20, color: icons)))
          ],
        ));
  }
}
