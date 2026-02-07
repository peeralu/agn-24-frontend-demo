import 'package:get/get.dart';

class CustomerProfileController extends GetxController {
  final vehicles = [
    {
      "carName": "Toyota Corolla Altis 2022",
      "licensePlate": "กข-1234",
      "insuranceType": "ประกันชั้น 1",
      "company": "วิริยะประกันภัย",
      "expireDate": "31/12/2025",
      "status": "ACTIVE",
      "ownerName": "นายสมชาย ใจดี",
      "carColor": "สีขาว",
    },
    {
      "carName": "Honda Civic 2021",
      "licensePlate": "ขค-5678",
      "insuranceType": "ประกันชั้น 2+",
      "company": "เมืองไทยประกันภัย",
      "expireDate": "15/10/2025",
      "status": "EXPIRE_SOON",
      "ownerName": "นายสมชาย ใจดี",
      "carColor": "สีดำ",
    },
    {
      "carName": "Isuzu D-Max 2020",
      "licensePlate": "งจ-8899",
      "insuranceType": "ประกันชั้น 3",
      "company": "กรุงเทพประกันภัย",
      "expireDate": "05/08/2025",
      "status": "ACTIVE",
      "ownerName": "นายสมชาย ใจดี",
      "carColor": "สีเทา",
    },
    {
      "carName": "Toyota Fortuner 2023",
      "licensePlate": "ฌน-4321",
      "insuranceType": "ประกันชั้น 1",
      "company": "ทิพยประกันภัย",
      "expireDate": "01/01/2026",
      "status": "ACTIVE",
      "ownerName": "นางสาวสุภาวดี ใจดี",
      "carColor": "สีดำ",
    },
    {
      "carName": "Mazda 2 2019",
      "licensePlate": "ฎก-2468",
      "insuranceType": "ประกันชั้น 2",
      "company": "อลิอันซ์ อยุธยา",
      "expireDate": "20/06/2025",
      "status": "EXPIRE_SOON",
      "ownerName": "นายสมชาย ใจดี",
      "carColor": "สีแดง",
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
