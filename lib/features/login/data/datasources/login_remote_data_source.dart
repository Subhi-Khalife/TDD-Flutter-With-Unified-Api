import 'package:dartz/dartz.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/features/login/data/models/login_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/api_proccess.dart';
import '../../../../core/unified_api/post_api.dart';
import '../../domain/entities/login.dart';
import '../models/login_model.dart';

class LoginRemoteDataSource extends ApiProcess{
  Future<Either<Failure,Login>> loginByPhoneRemote(param) async {

    print("Layer 3 : Data  dataSource => called request from server  <=");

    final request = PostApi(
                      param: param,
                      requestName: "LOGIN",
                      url: "client/auth/login")
                      .callRequest ;

    final response = await handlingRequest(
      requestCall:  request
    );

    print("Layer 3 : Data  dataSource => return response to  repository impl <=");


    return response.fold(
            (failure) => Left(failure),
            (body) => Right(loginModelFromJson(body).data));

  }

}
