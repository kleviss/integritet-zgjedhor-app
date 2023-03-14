import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
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
        children: [
          InkWell(
            onTap: () {
              // context go with params
              context.push('/targat');
            },
            child: const CategoryItem(
              image: 'assets/icons/targat.png',
              title: 'Targat',
              subtitle: '26 raportime',
            ),
          ),
          InkWell(
            onTap: () {
              // context go with params
              context.go('/shkelesit');
            },
            child: const CategoryItem(
              image: 'assets/icons/kandidatet.png',
              title: 'Shkelësit',
              subtitle: '6 zyrtarë',
            ),
          ),
          InkWell(
            onTap: () {
              // context go with params
              context.go('/bashkite');
            },
            child: const CategoryItem(
              image: 'assets/icons/harta.png',
              title: 'Bashkitë',
              subtitle: '4 shkelje',
            ),
          ),
          const CategoryItem(
            image: 'assets/icons/perfshihu.png',
            title: 'Pëfshihu',
            subtitle: '62 raportues',
          ),
          // CategoryItem(
          //   image: 'assets/icons/kodizgjedhor.png',
          //   title: 'Informacion',
          //   subtitle: 'Më shumë',
          // ),

          // CategoryItem(
          //   image: 'assets/icons/rrethnesh.png',
          //   title: 'Rreth nesh',
          //   subtitle: 'Misioni',
          // ),
        ]);
  }
}
