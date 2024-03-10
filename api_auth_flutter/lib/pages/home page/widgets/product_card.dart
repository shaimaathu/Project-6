import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.prise});
  final String image;
  final String title;
  final int prise;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: context.getHeight() / 1.5,
        width: context.getWidth() / 2,
        decoration: BoxDecoration(
            color: product, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                fit: BoxFit.cover,
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
            gapH15,
            SizedBox(width: context.getHeight(), child: Text(title)),
            gapH10,
            Text("$prise"),
          ],
        ));
  }
}
