import 'package:deke/pages/home/home_page.dart';
import 'package:deke/pages/mine/persion_page.dart';
import 'package:deke/pages/progress/progress_page.dart';
import 'package:deke/pages/technology/technology_page.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<BottomNavigationBarItem> _barItemList() {
    List<BottomNavigationBarItem> item = [];
    item.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'));
    item.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: '技术'));
    item.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: '进度'));
    item.add(
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: '我'));
    return item;
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('德克办公'),
      ),
      body: SafeArea(
          child: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          TechnologyPage(),
          ProgressPage(),
          PersonPage()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14, color: Colors.black),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, color: Colors.blueGrey),
        currentIndex: currentIndex,
        items: _barItemList(),
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
