import 'package:equatable/equatable.dart';

import 'add_on.dart';

class HailStatic extends Equatable {
  final List<String> dentSizeRangeList;
  final List<String> dentCountRangeList;
  final List<AddOn> addOnList;

  const HailStatic({
    required this.dentSizeRangeList,
    required this.dentCountRangeList,
    required this.addOnList,
  });

  @override
  List<Object?> get props => [
        dentSizeRangeList,
        dentCountRangeList,
        addOnList,
      ];

  @override
  bool? get stringify => true;
}
