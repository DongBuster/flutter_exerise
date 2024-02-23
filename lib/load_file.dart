import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_class_testcase/model/address_info.dart';
import 'package:flutter_class_testcase/model/district.dart';
import 'package:flutter_class_testcase/model/province.dart';
import 'package:flutter_class_testcase/model/ward.dart';

Future<List<dynamic>> loadData() async {
  try {
    String data = await rootBundle.loadString('assets/don_vi_hanh_chinh.json');
    // print('here:${jsonDecode(data).runtimeType}');
    Map<String, dynamic> jsonData = jsonDecode(data);
    // print('1');
    List<dynamic> provinceDatas = jsonData['province'];
    var provinceList =
        provinceDatas.map((json) => Province.fromJson(json)).toList();
    // print(provinceList);
    List<dynamic> districtDatas = jsonData['district'];
    var districtList =
        districtDatas.map((json) => District.fromJson(json)).toList();
    // print(districtList);
    List<dynamic> wardDatas = jsonData['ward'];
    var wardList = wardDatas.map((json) => Ward.fromJson(json)).toList();

    // print(wardList);
    // print('2');

    // for (int i = 0; i < provinceList.length; i++) {
    //   var addressInfo = AddressInfo(
    //     province: provinceList[i].name,
    //     district: districtList,
    //     ward: '',
    //     street: '',
    //   );
    // }
    return [provinceList, districtList, wardList];
  } catch (e) {
    debugPrint("Error loading data location: $e");
    return ['$e'];
  }
}
