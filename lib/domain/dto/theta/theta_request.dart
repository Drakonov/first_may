import 'package:first_may/domain/dto/theta/theta_session_request.dart';
import 'package:first_may/domain/dto/theta/theta_set_options_request.dart';
import 'package:first_may/domain/dto/theta/theta_take_picture_request.dart';

import 'request_object.dart';

class ThetaRequest<D extends RequestObject> {
  ThetaRequest({
    required this.parameters,
  });

  D parameters;
  static const String nameKey = 'name';
  static const String parametersKey = 'parameters';

  Map<String, dynamic> toJson() {
    if (D == ThetaSessionRequest) {
      return {
        ThetaRequest.nameKey: 'camera.startSession',
        // ThetaRequest.parametersKey: {},
        ThetaRequest.parametersKey: parameters.toJson(),
      };
    }
    if (D == ThetaSetOptionsRequest) {
      return {
        ThetaRequest.nameKey: 'camera.setOptions',
        ThetaRequest.parametersKey: parameters.toJson(),
      };
    }
    if (D == ThetaTakePictureRequest) {
      return {
        ThetaRequest.nameKey: 'camera.takePicture',
        ThetaRequest.parametersKey: parameters.toJson(),
      };
    }

    return {};
  }
}
