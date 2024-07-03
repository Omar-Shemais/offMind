import 'package:adhd/Features/home/data/models/medical_center_model.dart';
import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'center_state.dart';

class CenterCubit extends Cubit<CenterState> {
  final Repository repository;
  List<MedicalCenter> _allMedicalCenters = [];

  CenterCubit(this.repository) : super(CenterInitial());

  Future<void> fetchCenters() async {
    try {
      emit(CenterLoading());
      final medicalcenters = await repository.fetchCenters();
      _allMedicalCenters = medicalcenters;
      emit(CenterLoaded(medicalcenters));
    } catch (e) {
      emit(CenterError('faild to fetch center'));
    }
  }

  void searchCenters(String query) {
    if (query.isEmpty) {
      emit(CenterLoaded(_allMedicalCenters));
    } else {
      final filteredCenters = _allMedicalCenters
          .where((center) =>
              center.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(CenterLoaded(filteredCenters));
    }
  }
}
