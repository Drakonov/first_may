import 'package:first_may/domain/dto/theta/theta_progress.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theta_take_picture_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaTakePictureResponse {
  ThetaTakePictureResponse({
    required this.name,
    required this.progress,
    required this.id,
    required this.state,
  });

  String name;
  ThetaProgress progress;
  String id;
  String state;

  factory ThetaTakePictureResponse.fromJson(Map<String, dynamic> json) => _$ThetaTakePictureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaTakePictureResponseToJson(this);
}
