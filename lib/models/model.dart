List<int> itemIndex = [
  11, //0
  6, //1
  0, //2/
  13, //3
  3, //4
  10, //5
  5, //6
  0, //7
  4, //8
  5, //9
  4, //10
  9, //11
  2, //12
  0, //13
  0, //14
  15, //15
  3, //16
  9, //17
  6, //18
  13, //19
  3, //20
  6, //21
];

class CartDetails {
  String name;
  int price;
  int discount;
  int quantity;
  CartDetails(this.name, this.discount, this.price, this.quantity);
  List<CartDetails> cart = [];

  void getProduct(name, discount, price, quantity) {
    cart.add(CartDetails(name, discount, price, quantity));
  }
}
