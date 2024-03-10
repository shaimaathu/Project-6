
import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:api_auth_flutter/helper/sized.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
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
        height: context.getHeight(),
        width: context.getWidth(),
        decoration: BoxDecoration(
            color: product, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            gapH10,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: context.getHeight() / 6,
                  width: context.getWidth() / 1.5,
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
                      "https://paymentcloudinc.com/blog/wp-content/uploads/2021/08/product-ideas-to-sell.jpg",
                    );
                  },
                ),
              ),
            ),
            gapH20,
            Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
            gapH20,
            Text(
              email,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ));
  }
}
