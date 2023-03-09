import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:integriteti_zgjedhor_app/widgets/more_list_item.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Më Shumë',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/misioni.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                MoreListItem(
                  icon: CupertinoIcons.car_detailed,
                  title: 'Kontrollo targat',
                  onTap: () => context.go('/targat'),
                ),
                MoreListItem(
                  icon: CupertinoIcons.person_2_fill,
                  title: 'Lista e shkelësve',
                  onTap: () => context.go('/shkelesit'),
                ),
                MoreListItem(
                  icon: CupertinoIcons.map_fill,
                  title: 'Harta e shkeljeve',
                  onTap: () => context.go('/harta'),
                ),
                MoreListItem(
                  icon: CupertinoIcons.add_circled,
                  title: 'Përfshihu',
                  onTap: () => context.go('/perfshihu'),
                ),
                MoreListItem(
                  icon: CupertinoIcons.question_circle,
                  title: 'Informacion',
                  onTap: () => context.go('/informacion'),
                ),
                MoreListItem(
                  icon: CupertinoIcons.info,
                  title: 'Rreth nesh',
                  onTap: () => context.go('/rrethnesh'),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Text(
            '© 2023 - Të gjitha të drejtat e rezervuara',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
