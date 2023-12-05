import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  double _weight;

  TangibleAsset({
    required super.name,
    required this.price,
    required this.color,
    weight
  }) : _weight = weight;

  @override
  set weight(double weight) {
    _weight = weight;
  }

  @override
  double get weight => _weight;
}
