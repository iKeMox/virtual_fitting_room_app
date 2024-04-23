import 'package:graduation_project_fitting_app/core/config/constants.dart';
import 'package:http/http.dart' as http;

class ApiManager {


  static fetchDataCategories(String categoryId) async {
    var url = Uri.https(
      Constants.baseUrl,
      "/products/categories",
      {
        // "category:": categoriesModel.id,
      }
    );
    final response = await http.get(url);
    if(response.statusCode == 200) {
      print(response.body);
    }
  }

}