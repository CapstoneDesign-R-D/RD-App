import 'package:flutter/material.dart';
import 'package:flutter_app/components/textStyles.dart';

class FloorButton extends StatelessWidget {
  const FloorButton({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: Color(0xFFFFECA9),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: const Offset(0,5),
          )
        ],
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Stack(
          children: [
            Text(
              'B2F',
              style: buttonTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        )
      )
    );
  }
}