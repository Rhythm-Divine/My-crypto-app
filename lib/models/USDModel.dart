import 'dart:convert';

class USDModel {
  final num price;
  final num v24h;
  final num vChange24h;
  final num perChange1h;
  final num perChange24h;
  final num perChange7d;
  final num perChange30d;
  final num perChange60d;
  final num perChange90d;
  final num marketCap;
  final String lastUpdated;

  USDModel({
    required this.price,
    required this.v24h,
    required this.vChange24h,
    required this.perChange1h,
    required this.perChange24h,
    required this.perChange7d,
    required this.perChange30d,
    required this.perChange60d,
    required this.perChange90d,
    required this.marketCap,
    required this.lastUpdated,
  });
  factory USDModel.fromJson(Map<String, dynamic> json) {
    return USDModel(
        price: json["price"],
        v24h: json["volume_24h"],
        vChange24h: json["volume_change_24h"],
        perChange1h: json["percent_change_1h"],
        perChange24h: json["percent_change_24h"],
        perChange7d: json["percent_change_7d"],
        perChange30d: json["percent_change_30d"],
        perChange60d: json["percent_change_60d"],
        perChange90d: json["percent_change_90d"],
        marketCap: json["market_cap"],
        lastUpdated: json["last_updated"]);
  }
}
