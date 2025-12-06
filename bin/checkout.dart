import 'dart:io';

import 'package:sample_ecommerce_app/cart.dart';
import 'package:sample_ecommerce_app/product.dart';

const allProduct = [
  Product(id: 1, name: 'apples', price: 150.0),
  Product(id: 2, name: 'banana', price: 25.0),
  Product(id: 3, name: 'courgettes', price: 90.0),
  Product(id: 4, name: 'grapes', price: 200.0),
  Product(id: 5, name: 'mushrooms', price: 45.0),
  Product(id: 6, name: 'potatoes', price: 30.0),
];

void main() {
  final cart = Cart();
  while (true) {
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd items, (c)heckout:',
    );
    final line = stdin.readLineSync();
    if (line == 'v') {
      print(cart);
    } else if (line == 'a') {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print(cart);
      }
    } else if (line == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

Product? chooseProduct() {
  final productList = allProduct
      .map((product) => product.displayName)
      .join('\n');
  stdout.write("Available Products:\n$productList \nYour choice:");
  final line = stdin.readLineSync();

  for (var product in allProduct) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Not found');
  return null;
}

bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print('Cart is empty');
    return false;
  }
  final total = cart.total();
  print('Total:₹$total');
  stdout.write("Payment in cach:");
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }
  final paid = double.tryParse(line);
  if (paid == null) {
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print('Change:₹${change.toStringAsFixed(2)}');
    return true;
  } else {
    print('Not enough cash');
    return false;
  }
}
