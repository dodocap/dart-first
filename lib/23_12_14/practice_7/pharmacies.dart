class Pharmacies {
  int count;
  List<Pharmacy> stores;

  Pharmacies({
    required this.count,
    required this.stores,
  });

  factory Pharmacies.fromJson(Map<String, dynamic> json) {
    return Pharmacies(
      count: json['count'],
      stores: (json['stores'] as List<dynamic>).map((store) => Pharmacy.fromJson(store as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'stores': stores.map((store) => store.toJson()).toList(),
    };
  }
}

class Pharmacy {
  String address;
  String code;
  String? createdAt;
  double lat;
  double lng;
  String name;
  String? remainStatus;
  String? stockAt;
  String type;

  Pharmacy({
    required this.address,
    required this.code,
    this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    this.remainStatus,
    this.stockAt,
    required this.type,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      address: json['addr'],
      code: json['code'],
      createdAt: json['created_at'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      remainStatus: json['remain_stat'],
      stockAt: json['stock_at'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': address,
      'code': code,
      'created_at': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStatus,
      'stock_at': stockAt,
      'type': type,
    };
  }

  bool isIncompleteInfo() => createdAt == null || remainStatus == null || stockAt == null;

  @override
  String toString() {
    return 'Store{addr: $address, code: $code, created_at: $createdAt, lat: $lat, lng: $lng, name: $name, remain_stat: $remainStatus, stock_at: $stockAt, type: $type}\n';
  }
}
