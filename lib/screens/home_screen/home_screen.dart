import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants.dart';
import 'components/balance_card/balance_card.dart';
import 'components/favorites/favorites.dart';
import 'components/portfolio/portfolio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget header() {
    return Padding(
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
              const SizedBox(height: 5),
              Row(
                children: const [
                  CircleAvatar(
                    foregroundImage: AssetImage('assets/images/me.jpeg'),
                    backgroundColor: kBackgroundColor,
                    radius: 30,
                  ),
                  SizedBox(width: 10),
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
    );
  }

  // Widget bottomNavigationBar() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topCenter,
  //         end: const Alignment(0, -0.1),
  //         colors: [
  //           kBackgroundColor.withOpacity(0),
  //           kBackgroundColor,
  //         ],
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.only(top: 16, bottom: 48),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           for (final icon in [
  //             FontAwesomeIcons.house,
  //             FontAwesomeIcons.chartColumn,
  //             FontAwesomeIcons.wallet,
  //             FontAwesomeIcons.gear,
  //           ])
  //             Icon(
  //               icon,
  //               color: icon == FontAwesomeIcons.house
  //                   ? kPrimaryTextColor
  //                   : kSecondaryColor,
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
                  kBackgroundColor.withOpacity(0),
                ],
              ).createShader(bounds),
              blendMode: BlendMode.dstATop,
              child: ListView(
                padding: const EdgeInsets.only(top: 64, bottom: 24),
                children: [
                  header(),
                  const SizedBox(height: 36),
                  const BalanceCard(),
                  const SizedBox(height: 36),
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
