part of 'center_cubit.dart';

abstract class CenterState {}

class CenterInitial extends CenterState {}

class CenterLoading extends CenterState {}

class CenterLoaded extends CenterState {
  final List<MedicalCenter> centers;

  CenterLoaded(this.centers);
}

class CenterError extends CenterState {
  final String message;

  CenterError(this.message);
}
