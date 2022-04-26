import 'package:flutter/material.dart';
import 'package:ui_flutter/util/Constants.dart';
import 'package:ui_flutter/util/widget_function.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(this.text, this.icon, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        color: COLOR_DARK_BLUE,
        splashColor: Colors.white.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        onPressed: (){},
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            SizedBox(width: 10,),
            Text(text, style: const TextStyle(color: COLOR_WHITE),)
          ],
        ),
      ),
    );
  }
}
