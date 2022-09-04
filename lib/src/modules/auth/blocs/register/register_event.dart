part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String? email;

  const RegisterEmailChanged({@required this.email});

  @override
  List<Object> get props => [email!];

  @override
  String toString() => 'RegisterEmailChanged { email :$email }';
}

class RegisterPasswordChanged extends RegisterEvent {
  final String? password;

  const RegisterPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password!];

  @override
  String toString() => 'RegisterPasswordChanged { password: $password }';
}

class RegisterCPasswordChanged extends RegisterEvent {
  final String? password;
  final String? cpassword;

  const RegisterCPasswordChanged(
      {@required this.password, @required this.cpassword});

  @override
  List<Object> get props => [password!, cpassword!];

  @override
  String toString() =>
      'RegisterPasswordChanged { password: $password, cpassword: $cpassword }';
}

class RegisterNameChanged extends RegisterEvent {
  final String? name;

  const RegisterNameChanged({@required this.name});

  @override
  List<Object> get props => [name!];

  @override
  String toString() => 'RegisterPasswordChanged { name: $name }';
}

class RegisterPhoneChanged extends RegisterEvent {
  final String? phone;

  const RegisterPhoneChanged({@required this.phone});

  @override
  List<Object> get props => [phone!];

  @override
  String toString() => 'RegisterPhoneChanged { phone: $phone }';
}

class RegisterSubmitted extends RegisterEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? phone;

  const RegisterSubmitted(
      {@required this.email,
      @required this.password,
      @required this.name,
      @required this.phone});

  @override
  List<Object> get props => [email!, password!, name!, phone!];

  @override
  String toString() {
    return 'RegisterSubmitted { email: $email, password: $password , name: $name , phone : $phone  }';
  }
}
