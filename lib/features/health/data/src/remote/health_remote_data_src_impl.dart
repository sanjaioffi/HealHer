import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../../config/constants/constants.dart';
import '../../../../../config/services/services.dart';
import '../../../../../core/managers/params/hive/hive_params.dart';
import '../../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import '../../model/health_model.dart';
import 'health_remote_data_src.dart';

class HealthRemoteDataSrcImpl implements HealthRemoteDataSrc {
  @override
  Future<List<HealthModel>> getHealthRecommendationFromRemote() async {
    //
    final List<HealthModel> healthModels = [];

    final userDataMap = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDataReference,
      ),
    );

    final userIssues = userDataMap['userMedicalIssues'];

    String issueString = "";

    for (String userIssue in userIssues) {
      issueString = '$issueString$userIssue,';
    }

    issueString = issueString.substring(0, issueString.length - 1);

    String apiLink =
        "https://recommendation-endpoint.onrender.com/v1/recommend/ayurveda/$issueString";

    await http.get(Uri.parse(apiLink)).then(
      (response) {
        if (response.statusCode == 200) {
          //
          final apiResponse = jsonDecode(response.body);

          final List<dynamic> recommendations =
              apiResponse['ayush_recommendation'];

          // Iterate the recommendations and print the 78values
          for (Map<String, dynamic> model in recommendations) {
            for (String element in model.keys) {
              //
              log(element);
              //
              healthModels.add(
                HealthModel(
                  healthIssue: element,
                  healthRecommendations: model[element],
                ),
              );

              log("Sucessfully Added");
            }
          }

          log(healthModels[0].toString());

          return healthModels;

          //
        } else {
          log('Request failed with status: ${response.statusCode}.');
        }
      },
    ).catchError(
      (error) {
        log(error.toString());
      },
    );
    return healthModels;
  }
}
