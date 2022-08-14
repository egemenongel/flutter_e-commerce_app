import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/constants/enums/request_types.dart';
import 'package:ecommerce_app/core/utils/network/network_manager.dart';
import 'package:ecommerce_app/features/profile/model/profile_model.dart';

class ProfileService {
  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<ProfileModel?> fetchProfile() async {
    return await _networkManager!.request(
        method: ReqTypes.get,
        path: ApiConstants.profile,
        model: ProfileModel());
  }
}
