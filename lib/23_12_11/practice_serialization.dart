import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee({
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> map) {
    return Employee(
      name: map['name'],
      age: map['age'],
    );
  }
}

class Department {
  String name;
  Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'leader': leader.toJson(),
    };
  }

  factory Department.fromJson(Map<String, dynamic> map) {
    return Department(
      name: map['name'],
      leader: Employee.fromJson(map['leader']),
    );
  }
}

void main() {
  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final targetFile = File('$directoryPath/company.txt');

  final kdHong = Employee(name: '홍길동', age: 41);
  final generalAffairsDept = Department(name: '총무부', leader: kdHong);
  targetFile.writeAsStringSync(jsonEncode(generalAffairsDept));

  final readFile = File(targetFile.path);
  final readLines = readFile.readAsStringSync();
  final readMap = jsonDecode(readLines);
  final readGeneralAffairsDept = Department.fromJson(readMap);
  print(readGeneralAffairsDept.toJson());
}
