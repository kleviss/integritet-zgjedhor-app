import 'package:integriteti_zgjedhor_app/models/course.dart';
import 'package:integriteti_zgjedhor_app/models/module.dart';
import 'package:integriteti_zgjedhor_app/widgets/course_module.dart';
import 'package:integriteti_zgjedhor_app/widgets/progress_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CourseProgress extends StatelessWidget {
  final String courseId;

  CourseProgress({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    //get moduleList whose courseId is courseId
    final moduleList = Module.getModulesByCourseId(courseId);
    print(moduleList);
    return moduleList.isEmpty
        ?
        // if no modules, show no modules gif and text
        Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/no_modules.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('No modules yet',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Check back later ;)',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
          )
        : Column(
            children: [
              const ProgressHeader(),
              ...moduleList.map((module) => CourseModule(module)).toList(),
            ],
          );
  }
}
