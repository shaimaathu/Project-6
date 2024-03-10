import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users {
  Future createUser(
      {required email,
      required password,
      required name,
      required image}) async {
    const url = "https://api.escuelajs.co/api/v1/users/";
    final uri = Uri.parse(url);
    final body = {
      "name": name,
      "email": email,
      "password": password,
      "avatar": image
    };
    final request = await http.post(uri, body: body);
    final res = json.decode(request.body);
    print(request.statusCode);
    print(res);
    return request.statusCode;
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
    print(request.statusCode);
    print(res);
    return request.statusCode;
  }

  Future viewUsers() async {
    const url = "https://api.escuelajs.co/api/v1/auth/profile";
    final uri = Uri.parse(url);
    String token =
        " eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjE0MiwiaWF0IjoxNzA5NjM3OTM0LCJleHAiOjE3MTEzNjU5MzR9.XLBFJvF1J8umGhRR9s3W35tb5VLx6wsZb1PN1OkBx4g";
    final Key = {
      "Authorization": 'Bearer $token',
    };
    final request = await http.get(uri, headers: Key);
    final res = json.decode(request.body);
    print(request.statusCode);
    print(res);
    return request.statusCode;
  }

  Future uploadImage({required image}) async {
    const url = "https://api.escuelajs.co/api/v1/files/upload";
    final uri = Uri.parse(url);
    // String token =
    //     " eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjE0MiwiaWF0IjoxNzA5NjM3OTM0LCJleHAiOjE3MTEzNjU5MzR9.XLBFJvF1J8umGhRR9s3W35tb5VLx6wsZb1PN1OkBx4g";
    final body = {
      "file": image,
    };
    final request = await http.post(uri, body: body);
    final res = json.decode(request.body);
    print(request.statusCode);
    print(res);
    return request.statusCode;
  }
}
