import 'package:customer/app/modules/my_services/controllers/service_list_controller.dart';
import 'package:get/get.dart';

class ServiceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceListController>(() => ServiceListController());
  }
}

