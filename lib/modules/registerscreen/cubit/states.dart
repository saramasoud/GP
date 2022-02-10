abstract class  DoctorRegisterStates {}

class DoctorRegisterInitialState extends DoctorRegisterStates {}
class DoctorRegisterLoadingState extends DoctorRegisterStates {}
class DoctorRegisterSuccessState extends DoctorRegisterStates {}
class DoctorRegisterErrorState extends DoctorRegisterStates {
  final String error;
  DoctorRegisterErrorState(this.error);
}
class DoctorCreateUserSuccessState extends DoctorRegisterStates {}
class DoctorCreateUserErrorState extends DoctorRegisterStates {
  final String error;
  DoctorCreateUserErrorState(this.error);
}
class DoctorChangePasswordVisibilityState extends DoctorRegisterStates {}


