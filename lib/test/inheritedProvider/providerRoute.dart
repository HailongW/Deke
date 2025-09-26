import 'package:deke/test/inheritedProvider/cartModel.dart';
import 'package:deke/test/inheritedProvider/inheritedProvider.dart';
import 'package:flutter/material.dart';

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({super.key});

  @override
  State<ProviderRoute> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedProvider"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                Consumer<CartModel>(builder: (context, cart) {
                  return Text("总价: ${cart?.totalPrice}");
                }),
                Builder(builder: (context) {
                  print("RaisedButton build"); //在后续热重载时，可以看到该输出
                  return ElevatedButton(
                    child: const Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context,
                              listen: false)
                          ?.add(Item(20.0, 1));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class Consumer<T> extends StatelessWidget {
  const Consumer({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
