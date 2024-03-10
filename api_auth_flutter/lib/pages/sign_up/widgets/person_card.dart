import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key, required this.name, required this.email});
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            // child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "name: $name",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "email: $email",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
