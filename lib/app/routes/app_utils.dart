part of 'app_pages.dart';

extension RoutesUtils on String {
  String addPathParameter(Map<String, String> parameters) {
    var result = this;

    for (final entry in parameters.entries) {
      final key = ':${entry.key}';
      if (!result.contains(key)) {
        throw ArgumentError('Route does not contain parameter ${entry.key}');
      }

      result = result.replaceAll(key, Uri.encodeComponent(entry.value));
    }

    if (result.contains(':')) {
      throw ArgumentError('Missing path parameter in route: $result');
    }

    return result;
  }
}
