//import the course model
import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem({Key? key, required this.course}) : super(key: key);

  // build the course item widget with the course model
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            // context go with params
            context.go(
              '/course/${course.id}',
              extra: {'id': course.id!},
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      course.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 35.0, right: 8.0, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    course.author!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: kPrimaryDark,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    course.title!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: kFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "2h 06m",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: kFontLight,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          right: 6,
          child: GestureDetector(
            onTap: () {
              // context go with params
              context.go(
                '/course/${course.id}',
                extra: {'id': course.id!},
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: kPrimaryDark,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(
                  CupertinoIcons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // positioned to save course
        Positioned(
          bottom: 200,
          right: 10,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 2.0),
              child: Icon(
                course.id! == '2'
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color: kPrimaryDark,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 42,
          left: 4,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: kPrimaryDark,
              borderRadius: BorderRadius.circular(15),
            ),
            // author image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                course.authorImageUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }
}
