import 'package:ecommerce_app/features/shop/service/shop_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ShopService shopService;
  setUp(() {
    shopService = ShopService();
  });
  test('fetchAllProducts - test five elements ', () async {
    final response = await shopService.fetchAllProducts();

    expect(response, isNotEmpty);
  });
}
