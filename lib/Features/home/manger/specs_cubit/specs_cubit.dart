import 'package:adhd/Features/home/data/models/specs_model.dart';
import 'package:adhd/Features/home/data/repo/repository.dart';
import 'package:bloc/bloc.dart';



part 'specs_state.dart';

class SpecsCubit extends Cubit<SpecsState> {
  final Repository repository;
  List<Specs> _allSpecs = [];

  SpecsCubit(this.repository) : super(SpecsInitial());

  Future<void> fetchSpecs() async {
    try {
      emit(SpecsLoading());
      final specs = await repository.fetchSpecs();
      _allSpecs = specs;
      emit(SpecsLoaded(specs));
    } catch (e) {
     emit(SpecsError('faild to fetch specs'));
    }
  }

  void searchSpecs(String query) {
    if (query.isEmpty) {
      emit(SpecsLoaded(_allSpecs));
    } else {
      final filteredSpecs = _allSpecs
          .where((specs) => specs.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SpecsLoaded(filteredSpecs));
    }
  }
}


