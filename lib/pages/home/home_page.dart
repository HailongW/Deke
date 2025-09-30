import 'package:deke/test/inheriteWidgetRoute.dart';
import 'package:deke/test/inheritedProvider/providerRoute.dart';
import 'package:deke/test/stackSizeTest/stackSizeDemo.dart';
import 'package:deke/test/valueListenableBuilder.dart';
import 'package:deke/test/willPopScopeTestRoute.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const StackSizeDemo();
                }));
              },
              child: const Text('InheritedDemo'))
        ],
      ),
    );
  }
}
