
import 'package:http/http.dart' as http;

class AuthRepository {

  userDetails() async {

    var response = await http.get(Uri.parse("https://my-json-server.typicode.com/easygautam/data/users")); //getting url
    print(response.statusCode); //error handling
    return response;
  }

}




