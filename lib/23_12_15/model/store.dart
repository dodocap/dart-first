import 'package:json_annotation/json_annotation.dart';
part 'store.g.dart';

@JsonSerializable(explicitToJson: true)
class Store {
  String name;
  String address;
  String stock;

  Store({
    required this.name,
    required this.address,
    required this.stock,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  String toString() {
    return '매장명: $name, 주소: $address, 여분: $stock}';
  }
}