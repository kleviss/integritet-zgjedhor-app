import 'package:integriteti_zgjedhor_app/models/active_course.dart';
import 'package:integriteti_zgjedhor_app/widgets/active_course_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActiveCourses extends StatelessWidget {
  final activeCoursesList = ActiveCourse.generateActiveCourses();

  ActiveCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: activeCoursesList.length,
        itemBuilder: (context, index) {
          return ActiveCourseItem(activeCourse: activeCoursesList[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 2);
        },
      ),
    );
  }
}
