import 'package:hive/hive.dart';

const String cartBoxName = 'cart';

void openCartBox() async {
  await Hive.openBox(cartBoxName);
}

void ensureCartBoxIsOpen() {
  if (!Hive.isBoxOpen(cartBoxName)) {
    openCartBox();
  }
}

void addToCart(dynamic item) {
  ensureCartBoxIsOpen();
  final cartBox = Hive.box<dynamic>(cartBoxName);
  cartBox.add(item);
}

List<dynamic> getCartItems() {
  ensureCartBoxIsOpen();
  final cartBox = Hive.box<dynamic>(cartBoxName);
  return cartBox.values.toList();
}
