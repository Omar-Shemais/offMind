// ignore: library_prefixes
import 'package:adhd/core/models/user.dart' as User;
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInit());

  List<User.User> users = [];

  void getAllUsers() {
    emit(UserProfileLoading());
    FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        //+ if (element.data()['uId'] != userModel!.uId)
        users.add(User.User.fromJson(element.data()));
      }
    }).catchError((e) {});
    emit(UserProfileInit());
  }
}
