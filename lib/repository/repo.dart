import 'package:cryptotracker/models/BigData.dart';
import 'package:dio/dio.dart';

class Repository {
  static String mainURL = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "761fd644-9a9d-4be7-8d38-aa26f44b5a15";
  var currencyListAPI = "${mainURL}cryptocurrency/listings/latest";

  Dio _dio = Dio();
  Future<BigData> getCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListAPI);
      print(response.data);
      return BigData.fromJson(response.data);
    } catch (error, stackTrace) {
      print("exception: $error  ,dd $stackTrace");
      return BigData.withError("error");
    }
  }
}
