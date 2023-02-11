import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTp, required this.buttontitle});
  final VoidCallback onTp;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTp,
      child: Container(
        child: Center(
          child: Text(
            buttontitle,
            style: bmistyle,
          ),
        ),
        color: Color(0xFFea1556),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: widthlength,
        height: heightlength,
      ),
    );
  }
}
