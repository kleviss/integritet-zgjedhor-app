import 'package:integriteti_zgjedhor_app/models/course.dart';
import 'package:integriteti_zgjedhor_app/widgets/course_item.dart';
import 'package:flutter/cupertino.dart';

class FeatureCourses extends StatelessWidget {
  final courseList = Course.generateCourses();

  FeatureCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: courseList.length,
          itemBuilder: (context, index) {
            return CourseItem(course: courseList[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}
