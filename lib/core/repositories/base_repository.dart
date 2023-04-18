import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_may/core/domain/api_failure.dart';
import 'package:first_may/core/network/network_info.dart';
import 'package:first_may/domain/dto/base/auth_base_response.dart';
import 'package:first_may/domain/dto/base/base_response.dart';
import 'package:first_may/domain/dto/base/status.dart';
import 'package:retrofit/retrofit.dart';

class BaseRepository {
  final NetworkInfo networkInfo;

  BaseRepository(this.networkInfo);

  Future<Either<M, ApiFailure>> sendRequest<M>(
    Future<HttpResponse<M?>> request, {
    bool needConnectionCheck = true,
  }) async {
    if (!needConnectionCheck || await networkInfo.isConnected) {
      try {
        HttpResponse<M?> result = await request;
        M? data = result.data;
        if (data is BaseResponse) {
          if (data.status == Status.success) {
            return Left(data);
          } else {
            return Right(
              ApiFailure.request(code: data.error?.code, message: data.error?.errorMessage),
            );
          }
        }
        if (data is AuthBaseResponse) {
          if (data.status == Status.ok) {
            return Left(data);
          } else {
            return Right(
              ApiFailure.request(code: data.code, message: data.error),
            );
          }
        }
        return Left(data as M);
      } on DioError catch (error) {
        return Right(
          ApiFailure.request(
            code: error.response?.statusCode,
            message: error.response?.data['error'],
          ),
        );
      } catch (error) {
        return Right(
          ApiFailure.undefined(error: error),
        );
      }
    } else {
      return Right(
        ApiFailure.networkConnection(),
      );
    }
  }
}
