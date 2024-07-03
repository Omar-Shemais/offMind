part of 'singup_cubit.dart';

abstract class RegisterStates {}

class RegisterInit extends RegisterStates {}

class RegisterLoading extends RegisterStates {}
class RegisterError extends RegisterStates {}