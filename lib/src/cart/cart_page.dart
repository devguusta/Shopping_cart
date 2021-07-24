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
          backgroundColor: Colors.blueGrey,
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Total do carrinho:",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Observer(builder: (_) {
                  return Text(
                    widget.controller.cartPrice,
                    style: Theme.of(context).textTheme.headline6,
                    
                  );
                }),
              ],
            ),
          ),
        ),
        body: widget.controller.list.isEmpty
            ? Center(child: Text("OPS! Seu carrinho está vazio"))
            : Observer(builder: (_) {
                return SingleChildScrollView(
                          child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: widget.controller.list.length,
                        itemBuilder: (_, index) => Card(
                          child: Column(
                            children: [
                              ListTile(
                                title:
                                    Text(widget.controller.list[index].product.name),
                                trailing: Text(widget
                                    .controller.list[index].product.price
                                    .reais()),
                                onTap: () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("Valor Total : " +
                                        widget.controller.list[index].totalPrice),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          child: IconButton(
                                            onPressed: () =>
                                                widget.controller.removeItem(
                                              widget.controller.list[index].product,
                                            ),
                                            icon: Icon(Icons.remove),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            color: Colors.red.shade200,
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0, vertical: 8.0),
                                            child: Text(
                                              widget.controller.list[index].quantity
                                                  .toString(),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                            onPressed: () => widget.controller
                                                .addItem(widget
                                                    .controller.list[index].product),
                                            icon: Icon(
                                              Icons.add,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              color: Colors.blue.shade200),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                             
                            ],
                             
                          ),
                         
                        ),
                      ),
                    ],
                  ),
                );
              }));
  }
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
// }
