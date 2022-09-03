import 'QuoteModel.dart';

class DataModel {
  final int ID;
  final String name;
  final String symbol;
  final String slug;
  final int marketPairs;
  final String dateAdded;
  final List<dynamic> tags;
  final num maxSupply;
  final num circulatingSupply;
  final num totalSupply;
  final int cmcRank;
  final String lastUpdated;
  final QuoteModel quoteModel;

  DataModel(
      {required this.ID,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.marketPairs,
      required this.dateAdded,
      required this.tags,
      required this.maxSupply,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.cmcRank,
      required this.lastUpdated,
      required this.quoteModel});
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      ID: json["id"],
      name: json["name"],
      symbol: json["symbol"],
      slug: json["slug"],
      marketPairs: json["num_market_pairs"],
      dateAdded: json["date_added"],
      tags: json["tags"],
      maxSupply: json["max_supply"] ?? 0,
      circulatingSupply: json["circulating_supply"],
      totalSupply: json["total_supply"],
      cmcRank: json["cmc_rank"],
      lastUpdated: json["last_updated"],
      quoteModel: QuoteModel.fromJson(json["quote"]),
    );
  }
}
