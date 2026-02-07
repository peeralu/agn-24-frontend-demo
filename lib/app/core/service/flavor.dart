import 'package:get/get.dart';

class FlavorService {
  FlavorService({required this.flavor});

  static FlavorService get instance => Get.find<FlavorService>();
  final Flavor flavor;

  static Future<void> init({required Flavor flavor}) async {
    final flavorService = FlavorService(flavor: flavor);
    Get.put<FlavorService>(flavorService, permanent: true);
  }

  bool get isDev {
    return flavor.isDev;
  }

  bool get isSit {
    return flavor.isSit;
  }

  bool get isUat {
    return flavor.isUat;
  }

  bool get isProd {
    return flavor.isProd;
  }

  String get baseUrl {
    if (isProd) {
      return 'http://10.10.1.106';
    }
    return 'http://127.0.0.1:8080';
  }

  String get version {
    return '1.0.0';
  }
}

enum Flavor {
  dev,
  sit,
  uat,
  prod;

  static Flavor find(String rawValue) {
    return Flavor.values.firstWhere(
      (data) {
        return data.rawValue == rawValue;
      },
      orElse: () {
        return Flavor.prod;
      },
    );
  }

  String get rawValue {
    switch (this) {
      case Flavor.dev:
        return 'dev';
      case Flavor.sit:
        return 'sit';
      case Flavor.uat:
        return 'uat';
      case Flavor.prod:
        return 'prod';
    }
  }

  bool get isDev {
    return this == Flavor.dev;
  }

  bool get isSit {
    return this == Flavor.sit;
  }

  bool get isUat {
    return this == Flavor.uat;
  }

  bool get isProd {
    return this == Flavor.prod;
  }
}
