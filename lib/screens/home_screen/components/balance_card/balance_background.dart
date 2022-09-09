import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../../../../components/chart.dart';
import '../../../../mocks/mock_balance.dart';

class BalanceBackground extends StatelessWidget {
  const BalanceBackground({Key? key}) : super(key: key);

  Widget backgroundChart() {
    final minData = MockBalance.data.reduce(math.min);
    final maxData = MockBalance.data.reduce(math.max);

    return Chart(
      data: MockBalance.data,
      minData: minData,
      maxData: maxData,
      minY: 0.99 * minData,
      maxY: 1.01 * maxData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 24, 129, 121),
                Color.fromRGBO(29, 54, 68, 1),
              ],
            ),
          ),
          child: Stack(
            children: [
              //backgroundChart(),
            ],
          ),
        ),
      ),
    );
  }
}
