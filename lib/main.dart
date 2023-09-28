import 'package:blood/bussiness_logic/sign_in/login_cubit.dart';
import 'package:blood/bussiness_logic/sign_up/sign_up_cubit.dart';
import 'package:blood/core/api_service.dart';
import 'package:blood/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SignInCubit()),
        BlocProvider(create: (context)=>SignUpCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:const LoginScreen()
      ),
    );
  }
}

