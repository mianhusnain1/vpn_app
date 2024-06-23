import 'package:get/get.dart';
import 'package:vpn_app/Apis/api.dart';
import 'package:vpn_app/Model/Apimodel.dart';

class LocationController extends GetxController {
  List<Vpn> list = [];
  final RxBool isLoading =
      false.obs; // rxboolean allow you to create reactive bool
  Future<void> getVpnData() async {
    isLoading.value = true;
    list.clear();
    list = await API.getVpnServer();
    isLoading.value = false;
  }
}
