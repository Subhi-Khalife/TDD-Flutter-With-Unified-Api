import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tdd/features/login/data/repositories/login_repository_impl.dart';
import 'package:test_tdd/features/login/domain/usecases/login_use_email.dart';
import 'package:test_tdd/features/login/presentation/bloc/bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                print("Layer 1 : Presentation Pages => send event FetchLoginByPhone to Bloc on Tapped <=");

                BlocProvider.of<LoginBloc>(context)
                  ..add(FetchLoginByPhone(
                      phone: "+963-959379188", password: "12345"));
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 25,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is Loading)
                  return CircularProgressIndicator();
                else if (state is Success) {
                  print("Layer 1 : Presentation  Pages => Success state done and data in the house  <=");

                  return Text("user name : ${state.login.username}");
                } else if (state is Failed) {
                  print("Layer 1 : Presentation  Pages => Failed state  <=");

                  return Text("error : ${state.error}");
                } else
                  return Text("Wrong.......");
              },
            )
          ],
        ),
      ),
    );
  }
}
