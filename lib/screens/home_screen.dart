import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/widgets/active_courses.dart';
import 'package:integriteti_zgjedhor_app/widgets/categories/categories_sections.dart';
import 'package:integriteti_zgjedhor_app/widgets/categories/category_item.dart';
import 'package:integriteti_zgjedhor_app/widgets/category_title.dart';
import 'package:integriteti_zgjedhor_app/widgets/emoji_text.dart';
import 'package:integriteti_zgjedhor_app/widgets/feature_course.dart';
import 'package:integriteti_zgjedhor_app/widgets/my_app_bar.dart';
import 'package:integriteti_zgjedhor_app/widgets/search_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EmojiText(),
            const SizedBox(height: 20),
            const SearchInput(onSubmit: null),
            const CategoryTitle(lT: 'Kategoritë', rT: 'Të gjitha'),
            const CategoriesSection(),
            //const CategoryTitle(lT: 'Kontrollo', rT: 'Më shumë'),
            //FeatureCourses(),
            //const CategoryTitle(lT: 'Harta e shkelesve', rT: ''),
            //ActiveCourses(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: kFont,
        isExtended: true,
        tooltip: 'Raporto një shkelje',
        enableFeedback: true,
        icon: const Icon(
          CupertinoIcons.add,
          color: kBackground,
        ),
        label: const Text(
          'Raporto një shkelje',
          style: TextStyle(color: kBackground),
        ),
      ),
    );
  }
}

// build popular courses featuring an image and a title and call to action button
Widget _buildPopular() {
  return Container(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildPopularItem(
          'assets/images/illustration_1.jpg',
          'Marketing',
          '2 courses',
        ),
        _buildPopularItem(
          'assets/images/illustration_4.jpg',
          'Finance',
          '6 courses',
        ),
        _buildPopularItem(
          'assets/images/illustration_3.jpg',
          'Programming',
          '2 courses',
        ),
      ],
    ),
  );
}

// build popular Item
Widget _buildPopularItem(
  String image,
  String title,
  String subtitle,
) {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: 200,
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
    child: Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: kFontLight,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// build widget to show currently active course with a progress bar and a play button on the side
Widget _buildActiveCourse(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: MediaQuery.of(context).size.width - 40,
    decoration: BoxDecoration(
      color: kPrimaryLight,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: kFontLight.withOpacity(0.2),
          offset: const Offset(0, 12),
          blurRadius: 16,
        ),
      ],
      border: Border.all(
        color: kPrimaryLight,
        width: 3,
      ),
    ),
    child: Row(
      children: [
        Container(
          height: 100,
          width: 130,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/illustration_5.jpg'),
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
                  const Text(
                    'Flutter Basics',
                    style: TextStyle(
                      color: kFont,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: kAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(left: 5),
                    child: const Icon(
                      CupertinoIcons.play_arrow,
                      color: kBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                '2 lessons left',
                style: TextStyle(
                  color: kFontLight,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 10,
                width: 200,
                decoration: BoxDecoration(
                  color: kFontLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 100,
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
  );
}

// build widget to show currently trending courses
Widget _buildTrendingItems() {
  return Container(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildTrendingItem(
          'assets/images/illustration_2.jpg',
          'Marketing',
          '2 courses',
        ),
        _buildTrendingItem(
          'assets/images/illustration_4.jpg',
          'Finance',
          '6 courses',
        ),
        _buildTrendingItem(
          'assets/images/illustration_3.jpg',
          'Programming',
          '2 courses',
        ),
      ],
    ),
  );
}

// build trending Item
Widget _buildTrendingItem(
  String image,
  String title,
  String subtitle,
) {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: 200,
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
    child: Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: kFontLight,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
