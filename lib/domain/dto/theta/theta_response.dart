import 'package:first_may/domain/dto/theta/theta_session_request.dart';
import 'package:first_may/domain/dto/theta/theta_session_response.dart';
import 'package:first_may/domain/dto/theta/theta_take_picture_response.dart';

class ThetaResponse<D> {
  ThetaResponse({
    this.results,
  });

  D? results;

  factory ThetaResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> results = json['results'];
    if (D == ThetaSessionRequest) {
      return ThetaResponse(results: ThetaSessionResponse.fromJson(results) as D);
    }
    if (D == ThetaTakePictureResponse) {
      return ThetaResponse(results: ThetaTakePictureResponse.fromJson(results) as D);
    }
    return ThetaResponse();
  }
}
