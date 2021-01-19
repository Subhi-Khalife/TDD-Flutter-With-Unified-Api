import 'package:test_tdd/core/error/exception.dart';
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
    try {
      LoginModel loginModel = await LoginRemoteDataSource.loginEmailRemote(
          email: email, password: password);
      return right(loginModel.data);
    } on TestException {
      return left(TestError());
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
