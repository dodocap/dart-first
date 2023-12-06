import 'group.dart';
import 'interfaces.dart';
import 'terran/scv.dart';
import 'zerg/drone.dart';

void main() {
  final group = Group();
  List<Unit> units = [];
  for(int i =0; i<12; i++){
    final drone = Drone(name: 'Drone$i', hp: (i+1) * 10, damage: 5);
    units.add(drone);
    group.clickUnit(drone);
  }

  group.clickUnit(SCV(name: 'SCV', hp: 10, damage: 5));
  group.clickUnit(units[0]);
  group.clickUnit(SCV(name: 'SCV', hp: 10, damage: 5));
}
