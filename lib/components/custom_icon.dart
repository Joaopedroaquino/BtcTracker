import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomIcon extends StatelessWidget {
  final Widget icon;

  const CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor,
            kSecondaryColor,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, -1),
            color: Color.fromARGB(95, 211, 4, 118),
          ),
          BoxShadow(
            offset: Offset(-1, 1),
            color: Color.fromARGB(255, 18, 99, 238),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }
}
