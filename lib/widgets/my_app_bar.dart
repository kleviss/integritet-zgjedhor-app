import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBackground,
      elevation: 0,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Misioni Kombëtar për',
                style: TextStyle(
                  color: kFontLight,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.fade,
                ),
                maxLines: 1,
              ),
              SizedBox(width: 5),
              Text(
                'Integritet Zgjedhor',
                style: TextStyle(
                  color: kFontLight,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0, right: 20),
              padding: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: kFontLight.withOpacity(0.2),
                    offset: const Offset(0, 12),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, right: 6, top: 3, bottom: 3),
                child: Image(
                  image: AssetImage('assets/images/sq.png'),
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
