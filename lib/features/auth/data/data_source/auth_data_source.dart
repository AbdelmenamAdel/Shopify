import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/auth/auth_queries.dart';
import 'package:shopify/core/utils/app_strings.dart';
import 'package:shopify/features/auth/data/models/login/login_request_body.dart';
import 'package:shopify/features/auth/data/models/login/login_response.dart';
import 'package:shopify/features/auth/data/models/login/user_role_response.dart';
import 'package:shopify/features/auth/data/models/signup/sign_up_request_body.dart';
import 'package:shopify/features/auth/data/models/signup/sign_up_response.dart';

class AuthDataSource {
  const AuthDataSource(this._graphql);

  final ApiService _graphql;

  //Login
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response =
        await _graphql.login(AuthQueries().loginMapQuery(body: body));
    return response;
  }

  //UserRole
  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role => ${response.userRole}');
    return response;
  }

  // SignUp
  Future<SignUpResponse> signUp({required SignUpRequestBody body}) async {
    final response =
        await _graphql.signUp(AuthQueries().signUpMapQuery(body: body));
    return response;
  }

  // add user id in firebase to used with notfication data base
  Future<void> addUserIdFirebase({required String userId}) async {
    await FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(userId)
        .set({});
  }
}
