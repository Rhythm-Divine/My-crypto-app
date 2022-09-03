import 'USDModel.dart';

class QuoteModel {
  final USDModel usdModel;

  QuoteModel({required this.usdModel});
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(usdModel: USDModel.fromJson(json["USD"]));
  }
}
