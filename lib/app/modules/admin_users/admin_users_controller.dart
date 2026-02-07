import 'package:frontend/app/data/models/models.dart';
import 'package:frontend/app/data/services/api_service.dart';
import 'package:frontend/app/lib_controller.dart';

class AdminUsersController extends GetxController {
  final apiService = ApiService.instance;

  final users = <UserModel>[].obs;
  final isLoading = false.obs;

  @override
  void onReady() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchUsers();
    });
    super.onReady();
  }
}

extension AdminUsersControllerAction on AdminUsersController {
  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final fetchedUsers = await apiService.fetchUserList();
      users.value = fetchedUsers;
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onAdd() async {
    Get.toNamed(Routes.ADMIN_USERS_FORM.addPathParameter({'id': '0'}));
  }
}
