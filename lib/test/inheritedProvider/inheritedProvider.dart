import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  final T data; //需要在子树中共享的数据，保存点击次数

  const InheritedProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static InheritedProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    //如果返回true，则子树中依赖data的Widget会调用其State的didChangeDependencies()方法
    return true;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data; //需要在子树中共享的数据，保存点击次数
  final Widget child;

  // ignore: use_super_parameters
  const ChangeNotifierProvider({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T? of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider?.data;
  }

  @override
  State<ChangeNotifierProvider<T>> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if (oldWidget.data != widget.data) {
      //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    //给共享数据添加监听
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
