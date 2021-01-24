import 'package:test_tdd/core/error/exception.dart';
import 'package:test_tdd/core/unified_api/post_api.dart';
import 'package:test_tdd/features/login/data/datasources/login_remote_data_source.dart';
import 'package:test_tdd/features/login/data/models/user_model.dart';
import 'package:test_tdd/features/login/domain/entities/user.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_tdd/features/login/domain/repositories/login_repository.dart';

import '../datasources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {

  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl(){
    loginRemoteDataSource = LoginRemoteDataSource();
  }

  @override
  Future<Either<Failure, User>> loginUseEmail({Map<String,dynamic> param}) async {

    print("Layer 3 : Data  repository=> called loginUseEmail Function implementation  <=");

    final login = await loginRemoteDataSource.loginByPhoneRemote(param);

    print("Layer 3 : Data  repository=> getting data from data source  <=");

    return login;

  }
}
