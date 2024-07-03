import 'dart:io';
import 'package:adhd/core/utils/caching_utils/caching_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<File?> {
  ProfileCubit() : super(null) {
    _loadImage();
  }

  Future<void> _loadImage() async {
    String? imagePath = await CachingUtils.getProfileImagePath();
    if (imagePath != null) {
      emit(File(imagePath));
    }
  }

  Future<void> setImage(File image) async {
    await CachingUtils.setProfileImagePath(image.path);
    emit(image);
  }
}
