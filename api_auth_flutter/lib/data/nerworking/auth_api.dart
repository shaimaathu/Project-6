import 'dart:convert';
import 'dart:io';
import 'package:api_auth_flutter/data/data_layer.dart';
import 'package:api_auth_flutter/data/models/categories_model.dart';
import 'package:api_auth_flutter/data/models/prodect_model.dart';
import 'package:api_auth_flutter/data/models/response_upload.dart';
import 'package:api_auth_flutter/data/models/user_models.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Api {
  final get = GetIt.I.get<AllData>();
  Future signUpMethod({required UserModel user}) async {
    try {
      await http.post(Uri.parse("api.escuelajs.co/api/v1/users/"),
          body: json.encode(user.toMapSend()));
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<ResponseUpload> uploadImageMethod({required File image}) async {
    try {
      final response = await http.post(
          Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),
          body: json.encode(await image.readAsBytes()));
      return ResponseUpload.fromJson(json.decode(response.body));
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future logIn({required email, required password}) async {
    const url = "https://api.escuelajs.co/api/v1/auth/login";
    final uri = Uri.parse(url);
    final body = {
      "email": email,
      "password": password,
    };
    final request = await http.post(uri, body: body);
    final res = json.decode(request.body);
    if (request.statusCode <= 299 && request.statusCode >= 200) {
      get.auth = res["access_token"];
      List<UserModel> users = await Api().getUsers();
      for (var element in users) {
        if (element.email == email) {
          get.user = element;
        }
      }
    } else {
      throw Exception("there was an error");
    }
  }

  Future getProfile({
    required token,
  }) async {
    const url = "https://api.escuelajs.co/api/v1/auth/profile";
    final uri = Uri.parse(url);
    final Key = {
      "Authorization": 'Bearer $token',
    };
    final request = await http.get(uri, headers: Key);
    final Map<String, dynamic> response = json.decode(request.body);
    if (request.statusCode <= 299 && request.statusCode >= 200) {
      return UserModel.fromJson(response);
    }
  }

  Future getProduct() async {
    const url = "https://api.escuelajs.co/api/v1/products";
    final uri = Uri.parse(url);
    final request = await http.get(uri);
    final List response = json.decode(request.body);
    List<ProductsModel> products = [];
    for (var element in response) {
      products.add(ProductsModel.fromJson(element));
    }
    return products;
  }

  Future getCategories() async {
    const url = "https://api.escuelajs.co/api/v1/categories/";
    final uri = Uri.parse(url);
    final request = await http.get(uri);
    final List response = json.decode(request.body);
    List<Category> AllCategories = [];
    for (var element in response) {
      AllCategories.add(Category.fromJson(element));
    }
    return AllCategories;
  }

  Future getUsers() async {
    const url = "https://api.escuelajs.co/api/v1/users";
    final uri = Uri.parse(url);
    final request = await http.get(uri);
    final List response = json.decode(request.body);
    List<UserModel> users = [];
    for (var element in response) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }

  Future getOneCategories({required id}) async {
    const String apiLink = "https://api.escuelajs.co/api/v1/categories/";
    final String url = apiLink + id.toString();
    final uri = Uri.parse(url);
    final request = await http.get(uri);
    final response = json.decode(request.body);
    if (request.statusCode <= 299 && request.statusCode >= 200) {
      return response;
    } else {
      return null;
    }
  }

  Future createProduct(
      {required title,
      required price,
      required description,
      required categoryId,
      required images}) async {
    const String apiLink = "https://api.escuelajs.co/api/v1/products/";
    final uri = Uri.parse(apiLink);
    final Map<String, dynamic> body = {
      "title": title,
      "price": price,
      "description": description,
      "categoryId": categoryId.toString(),
      "images": [images]
    };
    try {
      final request = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      final response = json.decode(request.body);
      if (request.statusCode <= 299 && request.statusCode >= 200) {
      } else {
        throw const FormatException();
      }
    } catch (error) {
      throw const FormatException();
    }
  }

  Future createCategories({required name, required images}) async {
    const url = "https://api.escuelajs.co/api/v1/categories/";
    final uri = Uri.parse(url);
    final Map<String, dynamic> body = {
      "name": name,
      "image": [images]
    };
    final request = await http.post(uri);
    final List response = json.decode(request.body);
  }
}
