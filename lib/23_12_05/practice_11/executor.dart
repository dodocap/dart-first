import 'hero.dart';
import 'poison_slime.dart';

void main() {
  final poisonSlime = PoisonSlime('A');
  final hero = Hero(name: '용사', hp: 50);

  poisonSlime.attack(hero);
  poisonSlime.attack(hero);
  poisonSlime.attack(hero);
}
