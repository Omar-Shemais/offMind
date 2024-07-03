import 'package:adhd/Features/home/data/models/doctor_model.dart';
import 'package:adhd/Features/home/data/repo/repository.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';


part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final Repository repository;
    List<Doctor> _alldoctors = [];

  DoctorCubit(this.repository) : super(DoctorInitial());

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorLoading());
      final doctors = await repository.fetchDoctors();
       _alldoctors = doctors;
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError('faild to fetch doctors'));
    }
  }

  void searchDoctors(String query) {
    if (query.isEmpty) {
      emit(DoctorLoaded(_alldoctors));
    } else {
      final filteredCenters = _alldoctors
          .where((center) => center.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(DoctorLoaded(filteredCenters));
    }
  }
}


