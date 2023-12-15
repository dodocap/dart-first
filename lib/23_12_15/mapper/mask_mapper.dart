import '../dto/pharmacies_dto.dart';
import '../model/store.dart';

extension StoreMap on PharmacyDTO {
  Store mapFromPharmacyToStore() {
    return Store(
      name: name ?? '(이름없음)',
      address: addr ?? '(주소없음)',
      stock: _stockType(type),
    );
  }

  String _stockType(String? type) {
    String typeString;
    switch(type) {
      case '01':
        typeString = '있음';
        break;
      case '02':
        typeString = '품절';
        break;
      default:
        typeString = '(모름)';
        break;
    }
    return typeString;
  }
}
