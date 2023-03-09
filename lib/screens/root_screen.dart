import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.label, required this.detailsPath});

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            TextButton(
              onPressed: () => context.go(detailsPath),
              child: const Text('Go to details'),
            ),
          ],
        ),
      ),
    );
  }
}
