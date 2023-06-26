import 'package:hive/hive.dart';

const String WishBoxName = 'wish';

void openWishBox() async {
  await Hive.openBox(WishBoxName);
}

void ensureWishBoxIsOpen() {
  if (!Hive.isBoxOpen(WishBoxName)) {
    openWishBox();
  }
}

void addToWish(dynamic item) {
  ensureWishBoxIsOpen();
  final wishBox = Hive.box<dynamic>(WishBoxName);
  wishBox.add(item);
}

List<dynamic> getCartItems() {
  ensureWishBoxIsOpen();
  final wishBox = Hive.box<dynamic>(WishBoxName);
  return wishBox.values.toList();
}
