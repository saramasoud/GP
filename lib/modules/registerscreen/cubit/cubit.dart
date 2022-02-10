
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/modules/registerscreen/cubit/states.dart';


class RegisterCubit extends Cubit<DoctorRegisterStates>
{
  RegisterCubit(): super(DoctorRegisterInitialState());

  static RegisterCubit get(context)=> BlocProvider.of(context);
}



