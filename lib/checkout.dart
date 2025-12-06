import 'dart:io';

class Product {
  final int id;
  final String name;
  final double price;

  const Product({required this.id, required this.name, required this.price});

  // String get displayName => '$name ₹$price';
  String get displayName => '($initial)${name.substring(1)}:₹$price';
  String get initial => name.substring(0, 1); //0 => index and 1=> length.
}

class Item {
  const Item({required this.product, this.quantity = 1});
  // on default quantity will be one when user chooses an item.
  final Product product;
  final int quantity;
  // creating getter value to give us product price.
  double get price => quantity * product.price;
}

class Cart {}

const allProduct = [
  Product(id: 1, name: 'apples', price: 150.0),
  Product(id: 2, name: 'banana', price: 25.0),
  Product(id: 3, name: 'courgettes', price: 90.0),
  Product(id: 4, name: 'grapes', price: 200.0),
  Product(id: 5, name: 'mushrooms', price: 45.0),
  Product(id: 6, name: 'potatoes', price: 30.0),
];

void main() {
  while (true) {
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd items, (c)heckout:',
    );
    final line = stdin.readLineSync();
    if (line == 'v') {
      final product = chooseProduct();
      if (product != null) {
        print(product.displayName);
      }
    } else if (line == 'a') {
    } else if (line == 'c') {}
  }
}

// Function to choose and return a product.
Product? chooseProduct() {
  final productList = allProduct
      .map((product) => product.displayName)
      .join('\n');
  stdout.write("Available Products:\n$productList \nYour choice:");
  final line = stdin.readLineSync();

  // We don't want the user to choose product by typing each item, we ask them to choose initials with respect to the products.
  // to do that we need another getter variable to give us the initials of the name.
  // return products matching initials.
  for (var product in allProduct) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Not found');
  return null;
}

/*
Pseudocode - to have a clear direction of where we're going
1. Start with infinite Loop
2. prompt: view cart / add item / checkout
3. choose a product
4. add it to the cart
 print cart
 else it selection == view cart
 print cart 
 else if selection == checkout 
 do checkout
 exit
 end


*/ 

/* Format 
product 
1. id
2. name
3. price
-----------
1
^
|
v
1
-----------
item
1. product 
2. quantity 
3. price with respect to quantity. 
------------
N
^
|
v
1
-----------
cart 
1. items 
2. total
*/ 
