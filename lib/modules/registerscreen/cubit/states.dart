abstract class  DoctorRegisterStates {}

class DoctorRegisterInitialState extends DoctorRegisterStates {}
class DoctorRegisterLoadingState extends DoctorRegisterStates {}
class DoctorRegisterSuccessState extends DoctorRegisterStates {}
class RegisterErrorState extends DoctorRegisterStates {
  final String error;
  RegisterErrorState(this.error);
}
class DoctorRegisterChangePasswordVisibilityState extends DoctorRegisterStates {}


