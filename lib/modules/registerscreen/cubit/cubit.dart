
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/models/Doctor_app/Doctor_user_model.dart';
import 'package:register/modules/registerscreen/cubit/states.dart';


class RegisterCubit extends Cubit<DoctorRegisterStates> {
  RegisterCubit() : super(DoctorRegisterInitialState());

  get isEmailVerified => null;

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

          userCreate(
              name: name,
              email: email,
              phone: phone,
              uId: value.user!.uid
          );


    } )
        .catchError((error){
      emit(DoctorRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  })
  {
    DoctorUserModel model = DoctorUserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId,
        isEmailVerified: isEmailVerified,
    );

     FirebaseFirestore.instance
         .collection('users')
         .doc(uId)
         .set(model.toMap())
         .then((value)
     {
           emit(DoctorCreateUserSuccessState());
     })
         .catchError((error)
     {
       emit(DoctorCreateUserErrorState(error.toString()));

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

