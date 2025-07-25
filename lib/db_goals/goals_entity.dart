class GoalsEntity {
  int id;
  DateTime createdTime;
  String name;
  int setTime;
  int actualTime;

  GoalsEntity({
    required this.id,
    required this.createdTime,
    required this.name,
    required this.setTime,
    required this.actualTime,
  });

  factory GoalsEntity.fromJson(Map<String, dynamic> json) {
    return GoalsEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      name: json['name'],
      setTime: json['setTime'],
      actualTime: json['actualTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'name': name,
      'setTime': setTime,
      'actualTime': actualTime,
    };
  }

  String get setTimeString {
    final hours = setTime ~/ 3600;
    final minutes = (setTime-hours*3600) ~/ 60;
    final seconds = setTime % 60;
    final result =
        '${hours > 9 ? hours : '0$hours'}:${minutes > 9 ? minutes : '0$minutes'}:${seconds > 9 ? seconds : '0$seconds'}';
    return result;
  }

  String get actualTimeString {
    final hours = actualTime ~/ 3600;
    final minutes = (actualTime-hours*3600) ~/ 60;
    final seconds = actualTime % 60;
    final result =
        '${hours > 9 ? hours : '0$hours'}:${minutes > 9 ? minutes : '0$minutes'}:${seconds > 9 ? seconds : '0$seconds'}';
    return result;
  }
}
