import 'package:flutter/cupertino.dart';

class TextWithParagraphsItem {
  ///svgImagePath(String) будет перебиваться image(Widget)
  ///
  ///Если оба !=null, то будет отображаться image
  TextWithParagraphsItem(this.text, {this.image});

  String text;
  Widget? image;
}
