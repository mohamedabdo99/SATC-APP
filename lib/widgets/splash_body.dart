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
              'https://restya.com/wp-content/uploads/2021/05/1_8ygFKYb0Yo6Hc-vnScGA9A.png',
            ),
          ),
        ],
      ),
    );
  }
}
