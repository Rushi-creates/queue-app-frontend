// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QueueUser {
  int? id;
  int queue_fk;
  String? queue_name;
  int userAcc_fk;
  String? userAcc_name;
  int adminAcc_fk;
  String? adminAcc_name;
  String joinedTime;
  int? queueCount;
  int? myTurn;
  QueueUser({
    this.id,
    required this.queue_fk,
    this.queue_name,
    required this.userAcc_fk,
    this.userAcc_name,
    required this.adminAcc_fk,
    this.adminAcc_name,
    required this.joinedTime,
    this.queueCount,
    this.myTurn,
  });

  QueueUser copyWith({
    int? id,
    int? queue_fk,
    String? queue_name,
    int? userAcc_fk,
    String? userAcc_name,
    int? adminAcc_fk,
    String? adminAcc_name,
    String? joinedTime,
    int? queueCount,
    int? myTurn,
  }) {
    return QueueUser(
      id: id ?? this.id,
      queue_fk: queue_fk ?? this.queue_fk,
      queue_name: queue_name ?? this.queue_name,
      userAcc_fk: userAcc_fk ?? this.userAcc_fk,
      userAcc_name: userAcc_name ?? this.userAcc_name,
      adminAcc_fk: adminAcc_fk ?? this.adminAcc_fk,
      adminAcc_name: adminAcc_name ?? this.adminAcc_name,
      joinedTime: joinedTime ?? this.joinedTime,
      queueCount: queueCount ?? this.queueCount,
      myTurn: myTurn ?? this.myTurn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'queue_fk': queue_fk,
      'queue_name': queue_name,
      'userAcc_fk': userAcc_fk,
      'userAcc_name': userAcc_name,
      'adminAcc_fk': adminAcc_fk,
      'adminAcc_name': adminAcc_name,
      'joinedTime': joinedTime,
      'queueCount': queueCount,
      'myTurn': myTurn,
    };
  }

  factory QueueUser.fromMap(Map<String, dynamic> map) {
    return QueueUser(
      id: map['id'] != null ? map['id'] as int : null,
      queue_fk: map['queue_fk'] as int,
      queue_name:
          map['queue_name'] != null ? map['queue_name'] as String : null,
      userAcc_fk: map['userAcc_fk'] as int,
      userAcc_name:
          map['userAcc_name'] != null ? map['userAcc_name'] as String : null,
      adminAcc_fk: map['adminAcc_fk'] as int,
      adminAcc_name:
          map['adminAcc_name'] != null ? map['adminAcc_name'] as String : null,
      joinedTime: map['joinedTime'] as String,
      queueCount: map['queueCount'] != null ? map['queueCount'] as int : null,
      myTurn: map['myTurn'] != null ? map['myTurn'] as int : null,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => QueueUser.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory QueueUser.fromJson(String source) =>
      QueueUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QueueUser(id: $id, queue_fk: $queue_fk, queue_name: $queue_name, userAcc_fk: $userAcc_fk, userAcc_name: $userAcc_name, adminAcc_fk: $adminAcc_fk, adminAcc_name: $adminAcc_name, joinedTime: $joinedTime, queueCount: $queueCount, myTurn: $myTurn)';
  }

  @override
  bool operator ==(covariant QueueUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.queue_fk == queue_fk &&
        other.queue_name == queue_name &&
        other.userAcc_fk == userAcc_fk &&
        other.userAcc_name == userAcc_name &&
        other.adminAcc_fk == adminAcc_fk &&
        other.adminAcc_name == adminAcc_name &&
        other.joinedTime == joinedTime &&
        other.queueCount == queueCount &&
        other.myTurn == myTurn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        queue_fk.hashCode ^
        queue_name.hashCode ^
        userAcc_fk.hashCode ^
        userAcc_name.hashCode ^
        adminAcc_fk.hashCode ^
        adminAcc_name.hashCode ^
        joinedTime.hashCode ^
        queueCount.hashCode ^
        myTurn.hashCode;
  }
}
