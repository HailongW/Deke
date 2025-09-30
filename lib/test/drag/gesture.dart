import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  const Drag({super.key});

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: const CircleAvatar(
              child: Text("A"),
            ),
            onPanDown: (DragDownDetails details) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${details.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails details) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += details.delta.dx;
                _top += details.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails details) {
              //打印滑动结束时在x、y轴上的速度
              print(details.velocity);
            },
          ),
        )
      ],
    );
  }
}
