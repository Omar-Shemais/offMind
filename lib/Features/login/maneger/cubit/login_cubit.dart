import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/widgets/snack_bar.dart';
import 'package:adhd/main_page.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  final formKey = GlobalKey<FormState>();
  String? email, password;

  Future<void> login() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoading());
       try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!,
          password: password!,
      );
      if (credential.user?.uid != null) {
        RouteUtils.pushAndPopAll(const MainPaage());
        return;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message ?? "Something went wrong", isError: true);
    }
    emit(LoginInitial());
  }
}

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
//   final formKey = GlobalKey<FormState>();
//   String? email, password;
//   Future<void> login(BuildContext context) async {
//     formKey.currentState!.save();
//     if (!formKey.currentState!.validate()) {
//       return;
//     }
//     emit(LoginLoading());
//     try {
//       final response = await NetworkUtils.post(
//         'login',
//         data: {
//           "email": email,
//           "password": password,
//         },
//       );
//       await CachingUtils.cacheUser(response.data);
      
//       RouteUtils.pushAndPopAll(
//         const MainPaage(),
//       );
//     } on DioException {
//       showSnackBar('Somthing went wrong', isError: true);
//     }
//     emit(LoginInitial());
//   }
// }
