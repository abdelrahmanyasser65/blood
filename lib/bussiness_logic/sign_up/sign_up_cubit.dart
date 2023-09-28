
import 'package:blood/bussiness_logic/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_service.dart';
import '../../core/api_url.dart';
import '../../screens/home_screen.dart';

class SignUpCubit extends Cubit<SignUpState>{

  SignUpCubit():super(SignUpInitState());
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  Future postSignUp(context)async{
    var json={
      'first_name':"abdo",
      "last_name":"omar",
      "age":22,
      'email':emailController.text,
      'password':passwordController.text
    };
    emit(SignUpLoading());
    DioHelper.postData(
        url: ApiUrl.signUp,
        data: json
    ).then((value){
      if(value.statusCode==200){
        print("success");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }
      emit(SignUpSuccess());
    }).catchError((e){
      print("error");
      emit(SignUpError());
    });
  }

}