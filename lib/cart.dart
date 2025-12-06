import 'package:sample_ecommerce_app/item.dart';
import 'package:sample_ecommerce_app/product.dart';

class Cart {
  bool get isEmpty => _items.isEmpty;
  final Map<int, Item> _items = {};
  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);
  @override
  String toString() {
    if (_items.isEmpty) {
      return "Cart is empty";
    }
    final itemizedList = _items.values
        .map((item) => item.toString())
        .join('\n');
    return '---------\n$itemizedList\nTotal:₹${total()}--------';
  }
}
