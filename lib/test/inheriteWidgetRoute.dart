import 'package:deke/test/share.dart';
import 'package:flutter/material.dart';

class InheriteWidgetTestRoute extends StatefulWidget {
  const InheriteWidgetTestRoute({super.key});

  @override
  State<InheriteWidgetTestRoute> createState() =>
      _InheriteWidgetTestRouteState();
}

class _InheriteWidgetTestRouteState extends State<InheriteWidgetTestRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _Testwidget(),
            ),
            ElevatedButton(
                onPressed: () => setState(() {
                      ++count;
                    }),
                child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}

class _Testwidget extends StatefulWidget {
  const _Testwidget({super.key});

  @override
  State<_Testwidget> createState() => __TestwidgetState();
}

class __TestwidgetState extends State<_Testwidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    //父或祖先widget中的InheritedWidget 改变（updateShouldNotify返回true）时会被调佣
    //如果build 中没有依赖InheritedWidget, 则此回调不会被调用

    print('dependancies change');
  }
}
