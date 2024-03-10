import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchCategory extends StatelessWidget {
  SearchCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: context.getWidth() / 10,
            width: context.getWidth(),
            decoration: BoxDecoration(
              color: gray,
            ),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "search category by ID",
                    // style: GoogleFonts.notoSerifKannada(
                    //     color: containertext,
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w300),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
