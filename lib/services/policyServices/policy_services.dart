import 'package:dio/dio.dart';

Dio dio = Dio();

class PolicyServices {
  //getAllPolicy
  static dynamic getPolicy(token, searchString, searchCriteria) async {
    try {
      final response = await dio.get(
        'http://localhost:3000/api/v1/nbservices/policies',
        queryParameters: {
          "searchString": searchString,
          "searchCriteria": searchCriteria
        },
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get policy data');
      }
    } catch (err) {
      throw Exception('An error occurred: $err');
    }
  }

  //getBenefitsByPolicy
  static dynamic getBenefitsByPolicy(token, policyId) async {
    try {
      final response = await dio.get(
        'http://localhost:3000/api/v1/nbservices/benefitgetbypol/$policyId',
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );
      if (response.statusCode == 200) {
        return response.data['Benefit'];
      } else {
        throw Exception('Failed to get policy data');
      }
    } catch (err) {
      throw Exception('An error occurred: $err');
    }
  }

  //getClientssByPolicy
  static dynamic getClientsByPolicy(token, policyId) async {
    try {
      final response = await dio.get(
        'http://localhost:3000/api/v1/nbservices/clientsgetbypol/$policyId',
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );
      if (response.statusCode == 200) {
        return response.data['Clients'];
      } else {
        throw Exception('Failed to get clients data');
      }
    } catch (err) {
      throw Exception('An error occurred: $err');
    }
  }

  //getAddresssByPolicy
  static dynamic getAddresssByPolicy(token, policyId) async {
    try {
      final response = await dio.get(
        'http://localhost:3000/api/v1/nbservices/addressgetbypol/$policyId',
        options: Options(headers: {"Cookie": "Authorization=$token"}),
      );
      if (response.statusCode == 200) {
        return response.data['Address'];
      } else {
        throw Exception('Failed to get address data');
      }
    } catch (err) {
      throw Exception('An error occurred: $err');
    }
  }
}
