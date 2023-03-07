import 'dart:ui';

import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseAppBar extends StatelessWidget with PreferredSizeWidget {
  final Course course;

  CourseAppBar({super.key, required this.course});

  @override
  Size get preferredSize => const Size.fromHeight(280);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxHeight);
      return Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(course.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    // make sure we apply clip it properly
                    child: constraints.maxHeight < 120
                        ? BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 6,
            right: 26,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: constraints.maxHeight > 190 ? 1 : 0,
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  color: kAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    // Icon with Text
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Text(
                        'Start',
                        style: TextStyle(
                          color: kPrimaryLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 62,
            left: 26,
            child: GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: kPrimaryDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 66,
            right: 16,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: kPrimaryDark.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  // context.go('/');
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Icon(
                    '2' == '2'
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
