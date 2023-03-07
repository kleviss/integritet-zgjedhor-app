import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/models/course.dart';
import 'package:integriteti_zgjedhor_app/widgets/course_app_bar.dart';
import 'package:integriteti_zgjedhor_app/widgets/course_description.dart';
import 'package:integriteti_zgjedhor_app/widgets/course_progress.dart';
import 'package:integriteti_zgjedhor_app/widgets/progress_header.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  final String id;

  CourseScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final course = Course.getCourseById(id);
    //print(course.toString());
    return Scaffold(
      //appBar: const CourseAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          print(innerBoxIsScrolled);
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: CourseAppBar(course: course),
              //backgroundColor: kBackground,
              //foregroundColor: kFont,
              title: innerBoxIsScrolled
                  ? Text(
                      course.title!,
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 46,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    )
                  : null,
              leading: const Text(''), // remove back button
              elevation: 1,
            ),
          ];
        },
        body: Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              CourseDescription(course: course),
              CourseProgress(courseId: id),
            ],
          ),
        ),
        // slivers: [
        //   SliverAppBar(
        //     flexibleSpace: FlexibleSpaceBar(
        //       background: CourseAppBar(course: course),
        //     ),
        //     pinned: true,
        //     floating: true,
        //     backgroundColor: kBackground,
        //     expandedHeight: 280,
        //     //foregroundColor: kFont,
        //     title: Text("shjjdsajkd"),
        //     leading: const Text(''), // remove back button
        //   ),
        //   SliverList(
        //     delegate: SliverChildListDelegate(
        //       [
        //         CourseDescription(course: course),
        //         CourseProgress(courseId: id),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
