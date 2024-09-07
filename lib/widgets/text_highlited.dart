import 'package:flutter/material.dart';

class TextHighted extends StatelessWidget {
  final String text;
  final List<String> textToHighlight;
  final Color highlightColor;
  final Color normalTextColor;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  TextHighted(
      {super.key,
      required this.text,
      required this.textToHighlight,
      required this.highlightColor,
      required this.fontSize,
      required this.normalTextColor,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.normal}) {
    _listed();
  }

  // ignore: empty_constructor_bodies
  final List<String> _totalText = [];
  void _listed() => _totalText.addAll(text.split(' '));

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: textAlign!,
        text: TextSpan(
            children: List.generate(_totalText.length, (index) {
          if (textToHighlight.contains(_totalText[index])) {
            return TextSpan(
                text: '${_totalText[index]} ',
                style: TextStyle(
                  color: highlightColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ));
          } else {
            return TextSpan(
              text: '${_totalText[index]} ',
              style: TextStyle(
                color: normalTextColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            );
          }
        })));
  }
}
