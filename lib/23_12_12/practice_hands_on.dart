import 'dart:convert';

final String json = '''{
 "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": null
   },
   {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
       },
       {
         "price": 60.00,
         "cvtDatetime": "2023-03-26T08:08:45"
       }
     ]
   }
 ]
}''';


void main() {
  ChartDataList chartDataList = ChartDataList.fromJson(jsonDecode(json));
  print(chartDataList.toJson());
  print(jsonEncode(chartDataList));
}

class ChartDataList {
  List<ChartData>? collectionChartDataList;

  ChartDataList({
    this.collectionChartDataList,
  });

  Map<String, dynamic> toJson() {
    return {
      'collectionChartDataList': collectionChartDataList?.map((e) => e.toJson()).toList(),
    };
  }

  factory ChartDataList.fromJson(Map<String, dynamic> map) {
    return ChartDataList(
      collectionChartDataList: (map['collectionChartDataList'] as List<dynamic>?)
          ?.map((e) => ChartData.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class ChartData {
  String? collectionName;
  List<SalePrice>? collectionSalePriceList;

  ChartData({
    this.collectionName,
    this.collectionSalePriceList,
  });

  Map<String, dynamic> toJson() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePriceList?.map((e) => e.toJson()).toList(),
    };
  }

  factory ChartData.fromJson(Map<String, dynamic> map) {
    return ChartData(
      collectionName: map['collectionName'],
      collectionSalePriceList: (map['collectionSalePrice'] as List<dynamic>?)
          ?.map((e) => SalePrice.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class SalePrice {
  double? price;
  String? cvtDatetime;

  SalePrice({
    this.price,
    this.cvtDatetime,
  });

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatetime': cvtDatetime,
    };
  }

  factory SalePrice.fromJson(Map<String, dynamic> map) {
    return SalePrice(
      price: map['price'],
      cvtDatetime: map['cvtDatetime'],
    );
  }
}