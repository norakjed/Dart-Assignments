enum OrderStatus { Pending, Process, Delieverd, Cancel }

enum OrderType { Deleivery, Pickup }

class Product {
  String id;
  String name;
  double price;

  Product({required this.id, required this.name, required this.price});
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity});

  double subTotal() {
    return product.price * quantity;
  }
}

class Order {
  final String id;
  final DateTime date;
  final List<OrderItem> items;
  final OrderType type;
  String? address;
  OrderStatus status;

  Order({
    required this.id,
    required this.items,
    required this.type,
    this.address,
    this.status = OrderStatus.Pending,
  }) : date = DateTime.now();
  

  double calculateTotal() {
    double total = 0.0;
    for (var item in items) {
      total += item.subTotal();
    }
    return total;
  }

  void printReceipt() {
    print('------ RECEIPT ------');
    print('Order ID: $id');
    print('Date: $date');
    if (type == OrderType.Deleivery) {
      print("Deliver to address: $address");
    }
    print('Status: ${status.name}\n');

    for (var item in items) {
      print(
        '${item.product.name}  x${item.quantity}  \$${item.product.price}  =  \$${item.subTotal()}',
      );
    }

    print('----------------------');
    print('Total: \$${calculateTotal()}');
    print('----------------------');
  }
}

void main() {
  // Product
  var p1 = Product(id: '01', name: 'Shampoo', price: 10);
  var p2 = Product(id: '02', name: 'Toothbrush', price: 5);

  // OrderItem
  var item1 = OrderItem(product: p1, quantity: 1);
  var item2 = OrderItem(product: p2, quantity: 2);

  // Order
  var order1 = Order(id: '01', items: [item1, item2], type: OrderType.Pickup);
  var order2 = Order(id: '02', items: [item1], type: OrderType.Deleivery, address: 'Phom Penh');


  order1.printReceipt();
  order2.printReceipt();
}
