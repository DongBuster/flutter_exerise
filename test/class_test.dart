import 'package:flutter_class_testcase/model/address_info.dart';
import 'package:flutter_class_testcase/model/district.dart';
import 'package:flutter_class_testcase/model/province.dart';
import 'package:flutter_class_testcase/model/user_info.dart';
import 'package:flutter_class_testcase/model/ward.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Province', () {
    test('Creating a Province object', () {
      final province = Province(
        id: '1',
        name: 'Hanoi',
        level: 'tinh',
      );

      expect(province.id, '1');
      expect(province.name, 'Hanoi');
      expect(province.level, 'tinh');
    });
  });

  group('District', () {
    test('Creating a District object', () {
      final district = District(
        id: '001',
        name: 'Ba Dinh',
        provinceId: '002',
        level: 'quan',
      );

      expect(district.id, '001');
      expect(district.name, 'Ba Dinh');
      expect(district.level, 'quan');
      expect(district.provinceId, '002');
    });
  });

  group('Ward', () {
    test('Creating a Ward object', () {
      final ward = Ward(
        id: '0001',
        name: 'Cong Vi',
        districtId: '04',
        provinceId: '005',
        level: 'phuong',
      );

      expect(ward.id, '0001');
      expect(ward.name, 'Cong Vi');
      expect(ward.level, 'phuong');
      expect(ward.provinceId, '005');
      expect(ward.districtId, '04');
    });
  });

  group('AddressInfo', () {
    late Province province;
    late District district;
    late Ward ward;
    late String street;
    late AddressInfo addressInfo;

    setUp(() {
      province = Province(id: '1', name: 'Province 1', level: 'Level 1');
      district = District(
          id: '1',
          name: 'District 1',
          level: 'Level 1',
          provinceId: province.id);
      ward = Ward(
          id: '1',
          name: 'Ward 1',
          level: 'Level 1',
          provinceId: province.id,
          districtId: district.id);
      street = 'Street 1';

      addressInfo = AddressInfo(
        province: province,
        district: district,
        ward: ward,
        street: street,
      );
    });

    test('should have correct province', () {
      expect(addressInfo.province, equals(province));
    });

    test('should have correct district', () {
      expect(addressInfo.district, equals(district));
    });

    test('should have correct ward', () {
      expect(addressInfo.ward, equals(ward));
    });

    test('should have correct street', () {
      expect(addressInfo.street, equals(street));
    });
  });
  group('userInfo', () {
    late String name;
    late String email;
    late int phoneNumber;
    late DateTime birthday;
    late AddressInfo addressInfo;
    late UserInfo userInfo;
    setUp(() {
      name = 'dong';
      email = 'dong@gmail.com';
      phoneNumber = 03045903496;
      birthday = DateTime(2002, 3, 13);
      addressInfo = AddressInfo(
        province: Province(
          id: '1',
          name: 'Hanoi',
          level: 'tinh',
        ),
        district: District(
          id: '001',
          name: 'Ba Dinh',
          provinceId: '002',
          level: 'quan',
        ),
        ward: Ward(
          id: '0001',
          name: 'Cong Vi',
          districtId: '04',
          provinceId: '005',
          level: 'phuong',
        ),
        street: 'xom 5',
      );

      //-------
      userInfo = UserInfo(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        birthday: birthday,
        addressInfo: addressInfo,
      );
    });
    test('create UserInfo should have correct name', () {
      expect(userInfo.name, equals(name));
    });
    test('create UserInfo should have correct phoneNumber', () {
      expect(userInfo.phoneNumber, equals(phoneNumber));
    });
    test('create UserInfo should have correct email', () {
      expect(userInfo.email, equals(email));
    });
    test('create UserInfo should have correct birthday', () {
      expect(userInfo.birthday, equals(birthday));
    });
    test('create UserInfo should have correct addressInfo', () {
      expect(userInfo.addressInfo, equals(addressInfo));
    });
  });
}
