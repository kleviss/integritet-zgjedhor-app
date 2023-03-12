import 'dart:math';

import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class EmojiText extends StatelessWidget {
  EmojiText({
    super.key,
  });

  // generate a map of strings which contain motivational quotes
  final Map<String, String> emojiTextMap = {
    'Informohu dhe vepro!': ' 👊',
    'Raporto shkeljet!': ' 📸',
    'Vepro për integritet!': ' 🇦🇱',
    // 'You are the best!': ' 🥇',
    // 'You are the star of the day!': ' 💫',
    // 'Let\'s get to the next level!': ' 🚀',🎯
    // 'Bravo! You are the best!': ' 👏',
    // 'You are shining!': ' ✨',
    // 'Let\'s boost your brain power!': ' 🚀'
  };

  // function generate random number from 0 to 5
  List<String> _getRandomQuote() {
    final int randomNumber = Random().nextInt(emojiTextMap.length);
    return [
      emojiTextMap.keys.elementAt(randomNumber),
      emojiTextMap.values.elementAt(randomNumber)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> randomQuote = _getRandomQuote();
    // return a Container with Rich Text for emojis
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 18),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: randomQuote[0],
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: kFont),
            ),
            TextSpan(
              text: randomQuote[1],
              style: const TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
