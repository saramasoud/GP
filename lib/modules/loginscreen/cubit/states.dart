abstract class  DoctorLoginStates {}

class DoctorLoginInitialState extends DoctorLoginStates {}
class DoctorLoginLoadingState extends DoctorLoginStates {}
class DoctorLoginSuccessState extends DoctorLoginStates {}
class DoctorLoginErrorState extends DoctorLoginStates {
  final String error;
  DoctorLoginErrorState(this.error);
}

class DoctorChangePasswordVisibilityState extends DoctorLoginStates {}


