import 'package:jiffy/jiffy.dart';

enum MediaType { none, image, video, meeting }

extension MediaTypeExtension on MediaType {
  static MediaType fromString(String type) {
    switch (type) {
      case "image":
        return MediaType.image;
      case "video":
        return MediaType.video;
      case "meeting":
        return MediaType.meeting;
      default:
        return MediaType.none;
    }
  }

  String get name {
    switch (this) {
      case MediaType.none:
        return "none";
      case MediaType.image:
        return "image";
      case MediaType.video:
        return "video";
      case MediaType.meeting:
        return "meeting";
    }
  }

  bool get isImage {
    return this == MediaType.image;
  }

  bool get isVideo {
    return this == MediaType.video;
  }

  bool get isImageOrVideo {
    return this == MediaType.image || this == MediaType.video;
  }

  bool get isMeeting {
    return this == MediaType.meeting;
  }
}

class Media {
  Media({
    this.id,
    this.isActive,
    this.name,
    this.url,
    this.path,
    this.ref,
    this.type,
    this.date,
    this.duration,
    this.meeting,
  });

  final int? id;
  final bool? isActive;
  final String? name;
  final String? url;
  final String? path;
  final String? ref;
  final MediaType? type;
  final DateTime? date;
  final int? duration;
  final Meeting? meeting;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json["id"],
      isActive: json["isActive"],
      name: json["name"],
      url: json["url"],
      path: json["path"],
      ref: json["ref"],
      type: MediaTypeExtension.fromString(json["type"] ?? ""),
      date: DateTime.tryParse(json["date"] ?? ""),
      duration: json["duration"],
      meeting: json["meeting"] == null ? null : Meeting.fromJson(json["meeting"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "isActive": isActive,
    "name": name,
    "url": url,
    "path": path,
    "ref": ref,
    "type": type,
    "duration": duration,
    "meeting": meeting?.toJson(),
  };

  Jiffy getStartDate() {
    return Jiffy.parseFromDateTime(meeting!.startDate!).add(hours: 7);
  }

  Jiffy getEndDate() {
    return Jiffy.parseFromDateTime(meeting!.endDate!).add(hours: 7);
  }

  Media copyWith({
    int? id,
    bool? isActive,
    String? name,
    String? url,
    String? path,
    String? ref,
    MediaType? type,
    DateTime? date,
    int? duration,
    Meeting? meeting,
  }) {
    return Media(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      name: name ?? this.name,
      url: url ?? this.url,
      path: path ?? this.path,
      ref: ref ?? this.ref,
      type: type ?? this.type,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      meeting: meeting ?? this.meeting,
    );
  }
}

class Meeting {
  Meeting({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.roomName,
    required this.detail,
    required this.icon,
  });

  final int? id;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? roomName;
  final String? detail;
  final String? icon;

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      id: json["id"],
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      roomName: json["roomName"],
      detail: json["detail"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "roomName": roomName,
    "detail": detail,
    "icon": icon,
  };
}
