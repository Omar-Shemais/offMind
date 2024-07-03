// ignore: library_prefixes
import 'package:adhd/Features/community/models/user.dart' as User;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'states.dart';

class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit() : super(ChatsInit());

  List<User.User> users = [];

  Future<void> getUsers() async {
    emit(ChatsLoading());
    try {
      final result = await FirebaseFirestore.instance.collection('users').get();
      for (var i in result.docs) {
        if (i.data()['uid'] == FirebaseAuth.instance.currentUser?.uid) {
          continue;
        }
        users.add(User.User.fromJson(i.data()));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    emit(ChatsInit());
  }

}