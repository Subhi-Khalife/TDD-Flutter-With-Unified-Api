import 'package:test_tdd/core/error/exception.dart';
import 'package:test_tdd/core/unified_api/post_api.dart';
import 'package:test_tdd/features/login/data/datasources/login_remote_data_source.dart';
import 'package:test_tdd/features/login/data/models/login_model.dart';
import 'package:test_tdd/features/login/domain/entities/login.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_tdd/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<List<Login>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Login>> loginUseEmail(
      {String email, String password}) async {
    final param = {"phone": email,};
    Either<Failure, String> loginModel = await PostApi(
            param: param,
            requestName: "client/auth/login",
            token: null,
            url: "client/auth/login")
        .callRequest();

    return loginModel.fold(
      (failure) => Left(failure),
      (loginObj) => Right(loginModelFromJson(loginObj).data),
    );
   

    // try {
    //   LoginModel loginModel = await LoginRemoteDataSource.loginEmailRemote(email: email, password: password);
    //   return right(loginModel.data);
    // }on ServerException {
    //   return left(ServerFailure());
    // }
  }
}
