import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CourseDescription extends StatelessWidget {
  final Course? course;

  const CourseDescription({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          // Author name and avatar and course duration
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Author avatar
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(course!.authorImageUrl!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  // Author name and course duration
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      // Author name
                      Text(
                        course!.author!,
                        //'Flutter Team',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                // clock icon
                const Icon(
                  Icons.access_time,
                  color: kFontLight,
                  size: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                // Course duration
                Text(
                  course!.duration!,
                  //'06 hours 30 minutes',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: kFontLight,
                  ),
                ),
              ])
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // Course title
          Row(
            children: [
              Text(
                course!.title!,
                //'Flutter for Beginners',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Course description
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: Text(
                  course!.description!,
                  //'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. ',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kFontLight,
                    // space between letters
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
