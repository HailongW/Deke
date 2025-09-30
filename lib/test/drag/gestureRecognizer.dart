import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizer extends StatefulWidget {
  const GestureRecognizer({super.key});

  @override
  State<GestureRecognizer> createState() => _GestureRecognizerState();
}

class _GestureRecognizerState extends State<GestureRecognizer> {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text.rich(TextSpan(children: [
      const TextSpan(text: '你好，世界'),
      TextSpan(
          text: '点我变色',
          style: TextStyle(
              fontSize: 60, color: _toggle ? Colors.blue : Colors.red),
          recognizer: _tapGestureRecognizer
            ..onTap = () {
              setState(() {
                _toggle = !_toggle;
              });
            }),
      const TextSpan(text: '世界，你好'),
    ])));
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
}
