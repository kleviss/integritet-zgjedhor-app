import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? secondaryTitle;
  final String? secondarySubtitle;
  final String buttonText;
  final String goToPath;

  const InfoBox({
    Key? key,
    required this.title,
    required this.subtitle,
    this.secondaryTitle,
    this.secondarySubtitle,
    required this.buttonText,
    required this.goToPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey.shade700,
            ),
          ),
          if (secondaryTitle != null && secondarySubtitle != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                Text(
                  secondaryTitle!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  secondarySubtitle!,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16.0),
          OutlinedButton(
              onPressed: () => context.go(goToPath),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.blue),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.blue,
                    width: 0.0,
                  ),
                ),
              ),
              child: Text(buttonText)),
        ],
      ),
    );
  }
}
