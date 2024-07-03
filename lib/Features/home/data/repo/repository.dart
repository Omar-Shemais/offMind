// lib/repository.dart
import 'package:adhd/Features/home/data/models/medical_center_model.dart';
import 'package:adhd/Features/home/data/models/doctor_model.dart';
import 'package:adhd/Features/home/data/models/specs_model.dart';
import 'package:adhd/core/utils/network_utils/network_utils.dart';
import 'package:dio/dio.dart';

class Repository {


// fetchDoctors
  List<Doctor> doctors = [];
  Future<List<Doctor>> fetchDoctors() async {
    try {
      Response response = await NetworkUtils.get('doc/list');

      if (response.statusCode == 200) {
        for (var i in response.data) {
          final c = Doctor.fromJson(i);
          doctors.add(c);
        }
        Iterable jsonResponse = response.data;
        return jsonResponse.map((doctor) => Doctor.fromJson(doctor)).toList();
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }

  // fetchCenters
  List<MedicalCenter> medicalCenters = [];
  Future<List<MedicalCenter>> fetchCenters() async {
    try {
      Response response =
          await NetworkUtils.get('center/list');

      if (response.statusCode == 200) {
        for (var i in response.data) {
          final c = MedicalCenter.fromJson(i);
          medicalCenters.add(c);
        }
        Iterable jsonResponse = response.data;
        return jsonResponse
            .map((center) => MedicalCenter.fromJson(center))
            .toList();
      } else {
        throw Exception('Failed to load centers');
      }
    } catch (e) {
      throw Exception('Failed to load centers: $e');
    }
  }

  // fetchSpecs
  List<Specs> specss = [];
  Future<List<Specs>> fetchSpecs() async {
    try {
      Response response = await NetworkUtils.get('specs/list');
      

      if (response.statusCode == 200) {
        for (var i in response.data) {
          final c = Specs.fromJson(i);
          specss.add(c);
        }
        Iterable jsonResponse = response.data;
        return jsonResponse.map((specs) => Specs.fromJson(specs)).toList();
      } else {
        throw Exception('Failed to load SPeces');
      }
    } catch (e) {
      throw Exception('Failed to load SPecs: $e');
    }
  }
}
