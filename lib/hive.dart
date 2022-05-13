import 'package:hive_flutter/hive_flutter.dart';

import 'domain/lists/list.dart';
import 'domain/products/product.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(Product.adapter);
  Hive.registerAdapter(ShoppingList.adapter);

  // await Hive.deleteBoxFromDisk(ShoppingList.boxName);
  await Hive.openBox<ShoppingList>(ShoppingList.boxName);
}
