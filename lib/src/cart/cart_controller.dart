import 'package:cart_mobx/src/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  List list = ObservableList<ProductModel>();

  @observable
  String listLength = "0";

  @action
  void addItem(ProductModel product) {
    list.add(product);
    listLength = list.length.toString();
  }

  @action
  void removeItem(ProductModel product) {
    list.remove(product);
    listLength = list.length.toString();
  }
  
}