import 'package:ecommerce/model/cart_model.dart';
import 'package:flutter/widgets.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _cartList = [];

  List<CartModel> get cart {
    return _cartList;
  }

  void addToCart(CartModel _cart) {
    _cartList.add(_cart);
    notifyListeners();
  }

  void removeFromCart(CartModel _cart) {
    notifyListeners();
  }
}
