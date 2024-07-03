class PredictionRequest {
  final String gender;
  final String age;
  final String handedness;
  final String iq;

  PredictionRequest({
    required this.gender,
    required this.age,
    required this.handedness,
    required this.iq,
  });

  Map<String, dynamic> toJson() {
    return {
      'Gender': gender,
      'Age': age,
      'Handedness': handedness,
      'IQ': iq,
    };
  }
}

class PredictionResponse {
  final int prediction;

  PredictionResponse({required this.prediction});

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    return PredictionResponse(prediction: json['prediction']);
  }
}
