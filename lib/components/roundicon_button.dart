import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.sign, required this.onprssed});
  final IconData sign;
  final VoidCallback? onprssed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(sign),
      onPressed: onprssed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
