import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/models/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseModule extends StatelessWidget {
  final Module module;

  const CourseModule(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 150,
      child: Row(children: [
        Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: module.iconBorder,
                      width: 2,
                    ),
                    color: module.iconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    module.icon,
                    color: module.iconColor,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: List.generate(
                        20,
                        (index) => Expanded(
                              child: Container(
                                width: 2,
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : module.iconBorder,
                              ),
                            )),
                  ),
                ),
              ],
            )),
        Flexible(
            flex: 5,
            child: Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: module.moduleBg,
                  border: Border.all(color: module.moduleBorder, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          module.title,
                          style: const TextStyle(
                            color: kFontLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      module.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: kFont.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildCourseItemButtons(module.time, module.lesson),
                  ],
                ))),
      ]),
    );
  }

  Row _buildCourseItemButtons(duration, lessons) {
    return Row(
      children: [
        // buttons for play and download
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: kPrimaryDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.clock,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: kPrimaryDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.clock,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                lessons,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
