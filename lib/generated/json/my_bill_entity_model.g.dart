import 'package:cp_driver_app/entity/bill/my_bill_entity_model.dart';
import 'package:cp_driver_app/generated/json/base/json_convert_content.dart';

MyBillEntityModel $MyBillEntityModelFromJson(Map<String, dynamic> json) {
  final MyBillEntityModel myBillEntityModel = MyBillEntityModel();
  final bool? check = jsonConvert.convert<bool>(json['check']);
  if (check != null) {
    myBillEntityModel.check = check;
  }
  final String? billNo = jsonConvert.convert<String>(json['billNo']);
  if (billNo != null) {
    myBillEntityModel.billNo = billNo;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    myBillEntityModel.title = title;
  }
  final String? hkzq = jsonConvert.convert<String>(json['hkzq']);
  if (hkzq != null) {
    myBillEntityModel.hkzq = hkzq;
  }
  final int? yf = jsonConvert.convert<int>(json['yf']);
  if (yf != null) {
    myBillEntityModel.yf = yf;
  }
  final int? sf = jsonConvert.convert<int>(json['sf']);
  if (sf != null) {
    myBillEntityModel.sf = sf;
  }
  return myBillEntityModel;
}

Map<String, dynamic> $MyBillEntityModelToJson(MyBillEntityModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['check'] = entity.check;
  data['billNo'] = entity.billNo;
  data['title'] = entity.title;
  data['hkzq'] = entity.hkzq;
  data['yf'] = entity.yf;
  data['sf'] = entity.sf;
  return data;
}

extension MyBillEntityModelExtension on MyBillEntityModel {
  MyBillEntityModel copyWith({
    bool? check,
    String? billNo,
    String? title,
    String? hkzq,
    int? yf,
    int? sf,
  }) {
    return MyBillEntityModel()
      ..check = check ?? this.check
      ..billNo = billNo ?? this.billNo
      ..title = title ?? this.title
      ..hkzq = hkzq ?? this.hkzq
      ..yf = yf ?? this.yf
      ..sf = sf ?? this.sf;
  }
}
