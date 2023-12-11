class Order {
  String shopName;
  String phoneNumber;
  List<Item> items;

  Order(this.shopName, this.phoneNumber, this.items);

  Map<String, dynamic> toJson() {
    return {
      'shopName': shopName,
      'phoneNumber': phoneNumber,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class Item {
  String itemName;
  int quantity;

  Item(this.itemName, this.quantity);

  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'quantity': quantity,
    };
  }
}
