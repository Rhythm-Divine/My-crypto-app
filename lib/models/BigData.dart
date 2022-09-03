import 'package:flutter/material.dart';

import 'DataModel.dart';
import 'StatusModel.dart';

class BigData {
  final StatusModel statusModel;
  final List<DataModel> dataModel;

  BigData({required this.statusModel, required this.dataModel});
  factory BigData.fromJson(Map<String, dynamic> json) {
    var fetchedDataList = json["data"] as List;
    List<DataModel> fetchedDataModelList =
        fetchedDataList.map((e) => DataModel.fromJson(e)).toList();
    return BigData(
        statusModel: StatusModel.fromJson(json["status"]),
        dataModel: fetchedDataModelList);
  }
  BigData.withError(String error)
      : statusModel = StatusModel(
            tStamp: error,
            errorCode: 0,
            errorMessage: error,
            elapsed: 0,
            CreditCount: 0,
            notice: error,
            totalCount: 0),
        dataModel = [];
}
