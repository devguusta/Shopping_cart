import 'package:flutter/material.dart';
import 'package:cart_mobx/src/shared/utils/extensions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  final CartController controller;
  CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.blueGrey.shade300,
        ),
        body: Observer(builder: (_) {
          if (widget.controller.list.isEmpty) {
            return Center(child: Text("OPS! Seu carrinho está vazio"));
          } else {
            return Column(
              children: [
                StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  padding: EdgeInsets.all(8),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: widget.controller.list.length,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.controller.list[index].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.58),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 24.0, top: 14),
                                        child: Icon(Icons.remove_shopping_cart,
                                            color: Color.fromRGBO(0, 0, 0, 0.54)),
                                      ),
                                      onPressed: () {
                                        widget.controller.removeItem(
                                            widget.controller.list[index]);
                                      },
                                    ),
                                    IconButton(
                                      icon: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 24.0, top: 14),
                                        child: Icon(Icons.add_shopping_cart,
                                            color: Color.fromRGBO(0, 0, 0, 0.54)),
                                      ),
                                      onPressed: () {
                                        widget.controller.addItem(
                                            widget.controller.list[index]);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8),
                              child: Text(
                                (widget.controller.list[index].price as double)
                                    .reais(),
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.54),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        }));
  }

  // return ListView.builder(
  //         itemCount: widget.controller.list.length,
  //         itemBuilder: (_, index) => ListTile(
  //           title: Text(widget.controller.list[index].name),
  //           trailing: Text((widget.controller.list[index].price as double).reais() ),
  //           onTap: () {
  //            widget.controller.removeItem(widget.controller.list[index]);
  //           },
  //         ),
  //       );
}
