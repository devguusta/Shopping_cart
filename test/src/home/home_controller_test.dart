import 'package:cart_mobx/app.dart';
import 'package:cart_mobx/src/home/home_controller.dart';
import 'package:cart_mobx/src/shared/models/product_model.dart';
import 'package:cart_mobx/src/shared/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 var controller = HomeController();
  setUpAll((){
    controller = HomeController(); 
  });
  group('Home Controller', () {
    test('list length started empty', () {
      expect(HomeController().products.length, 0);
    });
    

    test('AppStatus should start empty', () {
     expect(controller.appStatus, AppStatus.empty );
     controller.getProducts();
    });
    test('list should generetaded 50 items', () async{
      // List productTest = controller.products;
      expect(controller.products.length, 0);
     await controller.getProducts();
      
      
     expect(controller.products.length, 50);
    });
    test('AppStatus should success', () async {
      expect(controller.appStatus, AppStatus.empty);
      await controller.getProducts();
      expect(controller.appStatus, AppStatus.success);
    });




  });
}