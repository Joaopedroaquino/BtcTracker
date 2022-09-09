import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'components/balance_card/balance_card.dart';
import 'components/portfolio/portfolio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget header() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bem vindo',
                  style: TextStyle(
                    fontSize: 24,
                    color: kSecondaryTextColor,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/images/me.jpeg'),
                      backgroundColor: kBackgroundColor,
                      radius: 30,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Joao Pedro',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                begin: const Alignment(0, 0.8),
                end: Alignment.bottomCenter,
                colors: [
                  kBackgroundColor,
                  kBackgroundColor.withOpacity(1),
                ],
              ).createShader(bounds),
              blendMode: BlendMode.dstATop,
              child: ListView(
                padding: const EdgeInsets.only(top: 64, bottom: 24),
                children: [
                  header(),
                  const SizedBox(height: 36),
                  const BalanceCard(),
                  const SizedBox(height: 45),
                  const Portfolio(),
                  const SizedBox(height: 36),
                  //const Favorites(),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: bottomNavigationBar(),
          // ),
        ],
      ),
    );
  }
}
