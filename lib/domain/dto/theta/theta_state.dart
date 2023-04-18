import 'package:first_may/domain/dto/theta/theta_state_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theta_state.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaState {
  ThetaState({
    required this.fingerprint,
    required this.state,
  });

  String fingerprint;
  ThetaStateValue state;

  factory ThetaState.fromJson(Map<String, dynamic> json) => _$ThetaStateFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaStateToJson(this);
}
