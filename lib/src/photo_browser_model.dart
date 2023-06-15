// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotoBrowserModel {
  PhotoBrowserModel._();
  static PhotoBrowserModel? _instance;
  factory PhotoBrowserModel() {
    _instance ??= PhotoBrowserModel._();
    return _instance!;
  }

  List<Photo> photos = [];
}

class Photo {
  final String id;
  final String server;
  final String secret;
  final String title;
  Photo({
    required this.id,
    required this.server,
    required this.secret,
    required this.title,
  });

  Photo copyWith({
    String? id,
    String? server,
    String? secret,
    String? title,
  }) {
    return Photo(
      id: id ?? this.id,
      server: server ?? this.server,
      secret: secret ?? this.secret,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'server': server,
      'secret': secret,
      'title': title,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as String,
      server: map['server'] as String,
      secret: map['secret'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Photo(id: $id, server: $server, secret: $secret, title: $title)';
  }

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.server == server &&
        other.secret == secret &&
        other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^ server.hashCode ^ secret.hashCode ^ title.hashCode;
  }
}
