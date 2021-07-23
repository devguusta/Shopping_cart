import 'package:cart_mobx/app.dart';
import 'package:cart_mobx/src/home/home_controller.dart';
import 'package:cart_mobx/src/shared/models/product_model.dart';
import 'package:cart_mobx/src/shared/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 final controller = HomeController();
  
  group('Home Controller', () {
    test('list length started empty', () {
      expect(HomeController().products.length, 0);
    });
    

    test('AppStatus should start empty', () {
     expect(controller.appStatus, AppStatus.empty );
    });
    test('list should generetaded 50 items', () async{
     await controller.getProducts();
      List productTest = controller.products;
      
     expect(productTest.length, 50);
    });
    test('AppStatus should success', () async {
      await controller.getProducts();
      expect(controller.appStatus, AppStatus.success);
    });




  });
}