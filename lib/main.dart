import 'package:flutter/material.dart';
import 'package:flutter_class_testcase/load_file.dart';
import 'package:flutter_class_testcase/model/data_table_model.dart';
import 'package:flutter_class_testcase/model/district.dart';
import 'package:flutter_class_testcase/model/province.dart';
import 'package:flutter_class_testcase/model/ward.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                FutureBuilder<List<dynamic>>(
                  future: loadData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final jsonContent = snapshot.data;

                      List<Ward> wards = jsonContent!.elementAt(2);
                      List<Province> provinces = jsonContent.elementAt(0);
                      List<District> districts = jsonContent.elementAt(1);

                      List<DataTableModel> dataTable = [];
                      for (var province in provinces) {
                        var dataTableModel = DataTableModel(
                            province: province.name, districts: [], wards: []);
                        List<String> provinceDistricts = [];
                        List<String> provinceWards = [];
                        for (var district in districts) {
                          if (district.provinceId == province.id) {
                            provinceDistricts.add(district.name);
                            for (var ward in wards) {
                              if (ward.provinceId == province.id &&
                                  ward.districtId == district.id) {
                                provinceWards.add(ward.name ?? '');
                              }
                            }
                          }
                        }

                        dataTableModel.districts = provinceDistricts;
                        dataTableModel.wards = provinceWards;
                        dataTable.add(dataTableModel);
                      }

                      return DataTable(
                          dataRowMaxHeight: double.infinity,
                          columns: const [
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Tỉnh/Thành \n phố',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Quận/Huyện',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Xã/Phường',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                          rows: dataTable.map((data) {
                            return DataRow(
                              cells: [
                                DataCell(Text(
                                  data.province,
                                )),
                                DataCell(
                                  Expanded(
                                    child: Column(
                                      children: data.districts.map((district) {
                                        return Text(district);
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Expanded(
                                    child: Column(
                                      children: data.wards
                                          .map((ward) => Text(ward))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList());
                    } else {
                      return const Text('Error read file !',
                          style: TextStyle());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
