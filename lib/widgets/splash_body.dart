import 'package:flutter/material.dart';
import 'package:satc/Theme/themes.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Spacer(),
          Text(
            'SATC',
            style: TextStyle(
              color: Color(0XFF206A4E),
              fontSize: 50.0,
            ),
          ),
          Spacer(),
          Image(
            image: NetworkImage(
              'https://us.123rf.com/450wm/harunatsukobo/harunatsukobo1903/harunatsukobo190300002/118883341-a-creator-like-male-upper-body-in-a-panic-over-too-busy.jpg?ver=6',
            ),
          ),
        ],
      ),
    );
  }
}
