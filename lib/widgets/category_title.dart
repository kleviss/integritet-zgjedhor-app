import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryTitle extends StatelessWidget {
  final String lT;
  final String rT;

  const CategoryTitle({super.key, required this.lT, required this.rT});

  @override
  Widget build(BuildContext context) {
    // Category title with left text and right button
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lT,
            style: const TextStyle(
                color: kFont, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => context.go('/more'),
            child: Row(children: [
              Text(
                rT,
                style: const TextStyle(
                    color: kFontLight,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(width: 5),
              const Icon(
                CupertinoIcons.arrow_right,
                color: kFontLight,
                size: 18,
              ),
            ]),
          ),
          // Arrow icon
        ],
      ),
    );
  }
}
