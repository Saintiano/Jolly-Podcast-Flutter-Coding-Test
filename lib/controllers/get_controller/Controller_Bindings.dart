
import 'package:get/get.dart';
import 'package:jolly_podcast_test/controllers/auth/auth_controller.dart';
import 'package:jolly_podcast_test/repositories/auth/auth_repository.dart';
import 'package:jolly_podcast_test/services/auth/auth_services.dart';



class Controler_Binding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthServices>(() => AuthServices());
    Get.lazyPut<AuthController>(() => AuthController(AuthHttpsRepository()));
  }

}