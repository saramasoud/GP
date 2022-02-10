
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/modules/registerscreen/cubit/states.dart';


class RegisterCubit extends Cubit<DoctorRegisterStates> {
  RegisterCubit() : super(DoctorRegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,

  }) {

    emit(DoctorRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        password: '',
        email: '',
    )
        .then((value) {
          print(value.user!.email);
          print(value.user!.uid);

          emit(DoctorRegisterSuccessState());
    } )
        .catchError((error){
      emit(DoctorRegisterErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(DoctorChangePasswordVisibilityState());
  }
}

