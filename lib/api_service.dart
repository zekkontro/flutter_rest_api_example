import 'package:flutter_rest_api_example/package_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  String baseURL =
      "https://flutter-packages-api.herokuapp.com/flutter-packages/api/";

  Future<PackageModel> getPackageInformaitons(String packageName) async {
    http.Response returnedData =
        await http.get(Uri.parse(baseURL + packageName));

    Map<String, dynamic> mapData = jsonDecode(returnedData.body);
    print(baseURL + packageName);
    print(returnedData.body);

    return PackageModel.fromMap(mapData);
  }
}
