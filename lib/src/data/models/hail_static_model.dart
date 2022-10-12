import '../../domain/entities/hail_static.dart';
import 'add_on_model.dart';

class HailStaticModel extends HailStatic {
  const HailStaticModel({
    required List<String> dentSizeRangeList,
    required List<String> dentCountRangeList,
    required List<AddOnModel> addOnList,
  }) : super(
          dentSizeRangeList: dentSizeRangeList,
          dentCountRangeList: dentCountRangeList,
          addOnList: addOnList,
        );

  factory HailStaticModel.fromJson(Map<String, dynamic> json) {
    return HailStaticModel(
      dentSizeRangeList: json['dentSizeRangeList'].cast<String>(),
      dentCountRangeList: json['dentCountRangeList'].cast<String>(),
      addOnList: json['addOnList'].map<AddOnModel>((x) => AddOnModel.fromJson(x)).toList(),
    );
  }
}
