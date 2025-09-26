import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  const WillPopScopeTestRoute({super.key});

  @override
  State<WillPopScopeTestRoute> createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressAt;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        final shouldPop = await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('确认退出？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('确认'),
              ),
            ],
          ),
        );
        if (shouldPop ?? false) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WillPopScopeTestRoute'),
        ),
        body: const Center(
          child: Text('1秒内连续按两次返回键退出'),
        ),
      ),
    );
  }
}
