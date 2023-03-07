import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:integriteti_zgjedhor_app/widgets/categories/category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 26,
        mainAxisSpacing: 26,
        padding: const EdgeInsets.all(18.0),
        children: const [
          CategoryItem(
            image: 'assets/images/illustration_3.jpg',
            title: 'Targat',
            subtitle: '26 raportime',
          ),
          CategoryItem(
            image: 'assets/images/illustration_2.jpg',
            title: 'Shkelësit',
            subtitle: '6 zyrtarë',
          ),
          CategoryItem(
            image: 'assets/images/illustration_1.jpg',
            title: 'Bashkitë',
            subtitle: '4 shkelje',
          ),
          CategoryItem(
            image: 'assets/images/illustration_4.jpg',
            title: 'Informacion',
            subtitle: 'Më shumë',
          ),
          CategoryItem(
            image: 'assets/images/illustration_5.jpg',
            title: 'Pëfshihu',
            subtitle: '62 raportues',
          ),
          CategoryItem(
            image: 'assets/images/illustration_5.jpg',
            title: 'Rreth nesh',
            subtitle: 'Misioni',
          ),
        ]);
  }
}
