part of 'specs_cubit.dart';

abstract class SpecsState {}

class SpecsInitial extends SpecsState {}

class SpecsLoading extends SpecsState {}

class SpecsLoaded extends SpecsState {
  final List<Specs> specs;

 SpecsLoaded(this.specs);
}

class SpecsError extends SpecsState {
  final String message;

  SpecsError(this.message);
}

