// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuperAdmin {
  String superString;
  SuperAdmin({
    required this.superString,
  });

  SuperAdmin copyWith({
    String? superString,
  }) {
    return SuperAdmin(
      superString: superString ?? this.superString,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'superString': superString,
    };
  }

  factory SuperAdmin.fromMap(Map<String, dynamic> map) {
    return SuperAdmin(
      superString: map['superString'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperAdmin.fromJson(String source) =>
      SuperAdmin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SuperAdmin(superString: $superString)';

  @override
  bool operator ==(covariant SuperAdmin other) {
    if (identical(this, other)) return true;

    return other.superString == superString;
  }

  @override
  int get hashCode => superString.hashCode;
}
