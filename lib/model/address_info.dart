import 'package:flutter_class_testcase/model/district.dart';
import 'package:flutter_class_testcase/model/province.dart';
import 'package:flutter_class_testcase/model/ward.dart';

class AddressInfo {
  late Province province;
  late District district;
  late Ward ward;
  late String street;
  AddressInfo({
    required this.province,
    required this.district,
    required this.ward,
    required this.street,
  });

  AddressInfo.fromJson(Map<String, dynamic> json)
      : province = json['province'],
        district = json['district'],
        ward = json['ward'],
        street = json['street'] as String;
  Map<String, dynamic> toJson() => {
        'province': province,
        'district': district,
        'ward': ward,
        'street': street,
      };
}
