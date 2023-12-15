import 'mapper/mask_mapper.dart';
import 'data_source/mask_api.dart';
import 'dto/pharmacies_dto.dart';
import 'model/store.dart';

void main() async {
  final MaskApi maskApi = MaskApi();
  final PharmaciesDTO pharmacies = await maskApi.getMaskInfo();
  final List<Store> storeList = pharmacies.stores?.map((e) => e.mapFromPharmacyToStore()).toList() ?? [];

  print(storeList);
}