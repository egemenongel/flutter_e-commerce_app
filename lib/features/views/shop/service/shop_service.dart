import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/constants/enums/request_types.dart';
import 'package:ecommerce_app/core/network/network_manager.dart';
import 'package:ecommerce_app/features/models/product_model.dart';

class ShopService {
  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<List<ProductModel>?> fetchAllProducts() async {
    return await _networkManager!.request(
        method: ReqTypes.get,
        path: ApiConstants.products,
        model: ProductModel());
  }
}
