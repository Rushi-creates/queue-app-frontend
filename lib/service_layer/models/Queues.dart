// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Queues {
  int? id;
  String name;
  String description;
  int setMaxPeople;
  bool? isOpen;
  int adminAcc_fk;
  int? totalPeople;
  Queues({
    this.id,
    required this.name,
    required this.description,
    required this.setMaxPeople,
    this.isOpen,
    required this.adminAcc_fk,
    this.totalPeople,
  });

  Queues copyWith({
    int? id,
    String? name,
    String? description,
    int? setMaxPeople,
    bool? isOpen,
    int? adminAcc_fk,
    int? totalPeople,
  }) {
    return Queues(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      setMaxPeople: setMaxPeople ?? this.setMaxPeople,
      isOpen: isOpen ?? this.isOpen,
      adminAcc_fk: adminAcc_fk ?? this.adminAcc_fk,
      totalPeople: totalPeople ?? this.totalPeople,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'setMaxPeople': setMaxPeople,
      'isOpen': isOpen,
      'adminAcc_fk': adminAcc_fk,
      'totalPeople': totalPeople,
    };
  }

  factory Queues.fromMap(Map<String, dynamic> map) {
    return Queues(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      description: map['description'] as String,
      setMaxPeople: map['setMaxPeople'] as int,
      isOpen: map['isOpen'] != null ? map['isOpen'] as bool : null,
      adminAcc_fk: map['adminAcc_fk'] as int,
      totalPeople:
          map['totalPeople'] != null ? map['totalPeople'] as int : null,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => Queues.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory Queues.fromJson(String source) =>
      Queues.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Queues(id: $id, name: $name, description: $description, setMaxPeople: $setMaxPeople, isOpen: $isOpen, adminAcc_fk: $adminAcc_fk, totalPeople: $totalPeople)';
  }

  @override
  bool operator ==(covariant Queues other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.setMaxPeople == setMaxPeople &&
        other.isOpen == isOpen &&
        other.adminAcc_fk == adminAcc_fk &&
        other.totalPeople == totalPeople;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        setMaxPeople.hashCode ^
        isOpen.hashCode ^
        adminAcc_fk.hashCode ^
        totalPeople.hashCode;
  }
}
