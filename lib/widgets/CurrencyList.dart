import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptotracker/models/DataModel.dart';
import 'package:cryptotracker/models/modelHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrencyList extends StatelessWidget {
  final List<DataModel> currency;
  const CurrencyList({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currencyImgURL =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crypto Tracker",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                // itemExtent: 160,
                itemCount: currency.length,
                itemBuilder: ((context, index) {
                  List<ChartModel> chartData = [
                    ChartModel(
                        val: currency[index].quoteModel.usdModel.perChange1h,
                        hours: 1),
                    ChartModel(
                        val: currency[index].quoteModel.usdModel.perChange24h,
                        hours: 24),
                    ChartModel(
                        val: currency[index].quoteModel.usdModel.perChange30d,
                        hours: 720),
                    ChartModel(
                        val: currency[index].quoteModel.usdModel.perChange60d,
                        hours: 1440),
                    ChartModel(
                        val: currency[index].quoteModel.usdModel.perChange90d,
                        hours: 2160),
                  ];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 4),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: currency[index]
                                          .quoteModel
                                          .usdModel
                                          .perChange7d >=
                                      0
                                  ? Colors.green
                                  : Colors.red,
                              blurRadius: 10,
                              blurStyle: BlurStyle.outer),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            height: 96,
                            width: 96,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: (currencyImgURL +
                                            currency[index].symbol +
                                            ".png")
                                        .toLowerCase(),
                                    placeholder: (context, URL) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, URL, error) =>
                                        Image.asset(
                                            "assets/images/dollar-img.png"),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  currency[index].symbol,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "\$${currency[index].quoteModel.usdModel.price.toStringAsFixed(2)}",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 8),
                                    height: 120,
                                    width: double.infinity,
                                    child: SfCartesianChart(
                                      plotAreaBorderWidth: 0,
                                      legend: Legend(isVisible: false),
                                      primaryXAxis: CategoryAxis(
                                        isVisible: true,
                                      ),
                                      primaryYAxis:
                                          CategoryAxis(isVisible: false),
                                      tooltipBehavior:
                                          TooltipBehavior(enable: false),
                                      series: <ChartSeries<ChartModel, String>>[
                                        LineSeries<ChartModel, String>(
                                            dataSource: chartData,
                                            xValueMapper:
                                                (ChartModel data, _) =>
                                                    data.hours.toString(),
                                            yValueMapper:
                                                (ChartModel data, _) =>
                                                    data.val)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    currency[index]
                                            .quoteModel
                                            .usdModel
                                            .perChange7d
                                            .toStringAsFixed(2) +
                                        "%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  height: 36,
                                  width: 72,
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(right: 16),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: currency[index]
                                                  .quoteModel
                                                  .usdModel
                                                  .perChange7d >=
                                              0
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(16)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
