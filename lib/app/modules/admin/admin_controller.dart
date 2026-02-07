import 'package:get/get.dart';

import 'package:frontend/app/data/models/user.dart';
import 'package:frontend/app/data/services/services.dart';
import 'package:frontend/app/modules/widgets/widgets.dart';
import 'package:frontend/app/routes/app_pages.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find<AdminController>();

  final apiService = ApiService.instance;

  final currentPage = '/admin/dashboard'.obs;
  final user = Rx<UserModel?>(null);

  @override
  void onInit() {
    setCurrentPage();
    super.onInit();
  }

  @override
  void onReady() {
    setCurrentPage();
    // fetchUserData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePage(String route) {
    currentPage.value = route;
    Get.toNamed(route);
  }

  void setCurrentPage() {
    final route = Get.currentRoute;
    currentPage.value = route;
  }
}

extension AdminControllerAction on AdminController {
  Future<void> fetchUserData() async {
    try {
      final fetchedUser = await apiService.fetchMe();
      user.value = fetchedUser;
    } catch (e) {
      user.value = null;
    }
  }

  void onSignOut() async {
    AppDialog.showWarning(
      title: "ออกจากระบบ",
      message: "คุณแน่ใจหรือไม่ว่าต้องการออกจากระบบ?",
      onOkTap: () async {
        Get.offAllNamed(Routes.LOGIN);
        AppToast.showInfo(message: "คุณได้ออกจากระบบเรียบร้อยแล้ว");
      },
      onCancelTap: () {},
    );
  }
}
