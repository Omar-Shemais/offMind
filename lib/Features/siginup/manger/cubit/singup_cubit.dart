import 'package:adhd/core/utils/caching_utils/caching_utils.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/snack_bar.dart';
import 'package:adhd/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'singup_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInit());
    final formKey = GlobalKey<FormState>();
  String? email, password,name;

  Future<void> register() async {
       formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoading());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      if (credential.user?.uid != null) {
        await setUserData(credential.user!.uid);
        await CachingUtils.cacheEmail(email!);
      await CachingUtils.cacheName(name!);
        RouteUtils.pushAndPopAll(const MainPaage());
        return;
      }
      throw FirebaseAuthException(code: "0", message: null);
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message ?? "Something went wrong", isError: true);
    }
    emit(RegisterInit());
  }

  Future<void> setUserData(String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'uid': uid,
      'name': name,
    });
  }
}























// class RegisterCubit extends Cubit<RegisterStates> {
//   RegisterCubit() : super(RegisterInit());

//   final formKey = GlobalKey<FormState>();
//   String? name, email, password;

//   Future<void> signUp(BuildContext context) async {
//     formKey.currentState!.save();
//     if (!formKey.currentState!.validate()) {
//       return;
//     }
//     emit(RegisterLoading());
//     try {
//       final response = await NetworkUtils.post(
//         'register',
//         data: {"name": name, "email": email, "password": password},
//       );
//       await CachingUtils.cacheEmail(email!);
//       await CachingUtils.cacheName(name!);
//       RouteUtils.pushAndPopAll(const LoginView());
//          showSnackBar(
//         '${response.data['message'] }',
//       );
      
     
//     } on DioException {
//       showSnackBar(
//         'Somthing went wrong',
//         isError: true
//       );  
//     }
//     emit(RegisterInit());
//   }
// }