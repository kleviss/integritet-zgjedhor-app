import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/models/active_course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class ActiveCourseItem extends StatelessWidget {
  final ActiveCourse activeCourse;
  const ActiveCourseItem({Key? key, required this.activeCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .go('/course/${activeCourse.id}', extra: {'name': activeCourse.id}),
      child: Container(
        margin: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: kPrimaryLight,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 365,
        child: Row(
          children: [
            Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(activeCourse.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        activeCourse.title!,
                        style: const TextStyle(
                          color: kFont,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Container(
                      //   height: 40,
                      //   width: 40,
                      //   margin: const EdgeInsets.only(left: 20, right: 6),
                      //   decoration: BoxDecoration(
                      //     color: kAccent,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   padding: const EdgeInsets.only(left: 5),
                      //   child: const Icon(
                      //     CupertinoIcons.play_arrow,
                      //     color: kBackground,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '${activeCourse.totalLessons!.toInt() - activeCourse.lessonsWatched!.toInt()} lessons left',
                        style: const TextStyle(
                          color: kFontLight,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        ' (${activeCourse.lessonsWatched!.toInt()}/${activeCourse.totalLessons!.toInt()})',
                        style: const TextStyle(
                          color: kPrimaryDark,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 10,
                    width: 120,
                    decoration: BoxDecoration(
                      color: kFontLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: (activeCourse.lessonsWatched!.toInt() /
                                  activeCourse.totalLessons!.toInt()) *
                              120,
                          decoration: BoxDecoration(
                            color: kAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
