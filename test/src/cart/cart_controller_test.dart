import 'package:cart_mobx/src/cart/cart_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = CartController();
  group('Cart Controller', (){
    test('Card List started empty', (){
      expect(controller.list.length, 0);
    });

  });
}