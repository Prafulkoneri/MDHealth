import 'package:flutter/services.dart';

class WordLimitingTextInputFormatter extends TextInputFormatter {
  final int maxWords;

  WordLimitingTextInputFormatter(this.maxWords);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_getWordCount(newValue.text) <= maxWords) {
      return newValue;
    }
    return oldValue;
  }

  int _getWordCount(String text) {
    return text.trim().split(RegExp(r'\s+')).length;
  }
}
