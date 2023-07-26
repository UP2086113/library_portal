// import 'package:driver_on_deck_driver/controllers/network_controller.dart';
// import 'package:get/get.dart';

// import '../api/api_service.dart';
// import '../controllers/profile_controller.dart';
// import '../service/storage_service.dart';

// class InitialBinding extends Bindings {
//   @override
//   void dependencies() async {
//     Get.lazyPut(() => ApiService(), fenix: true);
//     Get.put(NetworkController());
//     Get.lazyPut(() => ProfileController(), fenix: true);

//     await Get.putAsync<StorageService>(() => StorageService().init());
//   }
// }
