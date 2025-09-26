import 'package:flutter/material.dart';

class Item {
  Item(this.price, this.count);
  double price; //商品单价
  int count; // 商品份数
  //... 省略其他属性
}

class CartModel extends ChangeNotifier {
  // 购物车商品列表
  final List<Item> _items = [];

  // 添加商品
  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  // 移除商品
  void remove(Item item) {
    _items.remove(item);
  }

  // 获取所有商品
  List<Item> get items => _items;

  // 计算总价
  double get totalPrice =>
      _items.fold(0, (total, current) => total + current.price * current.count);
}
