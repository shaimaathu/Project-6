import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.getHeight() / 4,
        width: context.getWidth() / 2,
        decoration: BoxDecoration(
            color: product, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            gapH10,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: context.getHeight() / 7,
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
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3g5oTPvdxNYu1nZliDRHaNqm-Cl5hJt3toQ&usqp=CAU",
                    height: context.getHeight() / 7,
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
            gapH15,
            Text(name),
          ],
        ));
  }
}
