import 'package:json_annotation/json_annotation.dart';

part 'theta_take_picture_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaTakePictureRequest {
  ThetaTakePictureRequest();

  String name = 'camera.takePicture';

  factory ThetaTakePictureRequest.fromJson(Map<String, dynamic> json) => _$ThetaTakePictureRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaTakePictureRequestToJson(this);
}
