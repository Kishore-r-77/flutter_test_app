import 'package:dio/dio.dart';

Dio dio = Dio();

class AddressService {
  static dynamic getAllAddress(
    token,
    //  searchString,
    //  searchCriteria
  ) async {
    try {
      final response = await dio.get(
        'http://localhost:3000/api/v1/basicservices/addresses',
        // queryParameters: {
        //   "searchString": searchString,
        //   "searchCriteria": searchCriteria
        // },
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get address data');
      }
    } catch (err) {
      throw Exception('An error occurred: $err');
    }
  }

  static dynamic createAddress(
    token,
    companyId,
    addressLine1,
    addressLine2,
    addressLine3,
    addressLine4,
    addressLine5,
    addressType,
    addressPostCode,
    addressState,
    addressCountry,
    addressStartDate,
    addressEndDate,
    clientId,
  ) async {
    print(companyId);
    try {
      final response = await dio.post(
        'http://localhost:3000/api/v1/basicservices/addresscreate',
        data: {
          "CompanyID": companyId,
          "AddressLine1": addressLine1,
          "AddressLine2": addressLine2,
          "AddressLine3": addressLine3,
          "AddressLine4": addressLine4,
          "AddressLine5": addressLine5,
          "AddressType": addressType,
          "AddressPostCode": addressPostCode,
          "AddressState": addressState,
          "AddressCountry": addressCountry,
          "AddressStartDate": addressStartDate,
          "AddressEndDate": addressEndDate,
          "ClientID": int.tryParse(clientId)
        },
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );

      return response.data;
    } catch (err) {
      print(err);
      throw Exception(err);
    }
  }

  static void softDeleteAddress(token, id) async {
    try {
      await dio.delete(
        "http://localhost:3000/api/v1/basicservices/addressdelete/$id",
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );
    } catch (err) {
      throw Exception(err);
    }
  }
}
