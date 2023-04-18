import 'package:json_annotation/json_annotation.dart';

part 'theta_progress.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaProgress {
  ThetaProgress({
    required this.completion,
  });

  double completion;

  factory ThetaProgress.fromJson(Map<String, dynamic> json) => _$ThetaProgressFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaProgressToJson(this);
}
