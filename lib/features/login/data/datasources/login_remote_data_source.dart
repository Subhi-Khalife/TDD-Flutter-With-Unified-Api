import 'package:dartz/dartz.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/core/unified_api/handling_exception.dart';
import 'package:test_tdd/features/login/data/models/user_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/post_api.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class LoginRemoteDataSource with HandlingExceptionRequest{

  Future<Either<Failure,User>> loginByPhoneRemote(param) async {
    print("Layer 3 : Data  dataSource => called request from server  <=");

    final  postObject =  PostApi<UserModel>(
        param: param,
        requestName: "LOGIN",
        fromJson: loginModelFromJson,
        url: "client/auth/login");

    final request =postObject.callRequest ;

    final response = await handlingExceptionRequest<UserModel>(
      requestCall:  request
    );

    print("Layer 3 : Data  dataSource => return response to  repository impl <=");

    return response.fold(
            (failure) => Left(failure),
            (body) => Right(body.data));
  }
}
