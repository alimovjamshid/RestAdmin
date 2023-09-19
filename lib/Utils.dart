import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}

final Color colorGreenLight = Color(0xFF95DBD8);
final Color colorGreen1 = Color(0xFF7EB9B7);
final Color colorGreen2 = Color(0xFF469794);
final Color colorGreen3 = Color(0xFF0B6561);
final Color colorGreen4 = Color(0xFF02302E);
final Color colorPink = Color(0xFFC57B7B);
final Color colorBlue = Color(0xFF7DBDEB);
final Color colorGreen = Color(0xFF8FBB74);
final Color colorAppBarLight = Color(0xFFE3F8F7);
final Color colorSelect = Color(0xFF55FFF8);
final Color colorView = Color(0xFFC0C0C0);
final Color colorText = Color(0xFF817E7E);
final Color colorOnSelect = Color(0xFF62BAEC);
final Color colorBackground = Color(0xFFEBE8E8);

final months = [
  "Yanvar",
  "Fevral",
  "Mart",
  "Aprel",
  "May",
  "Iyun",
  "Iyul",
  "Avgust",
  "Sentabr",
  "Oktabr",
  "Noyabr",
  "Dekabr"
];

int day = DateTime.now().day;
int month = DateTime.now().month;
int year = DateTime.now().year;

String selectYear = "2023";
final List<String> listYears = ["2022", "2023", "2024", "2025", "2026"];

void dateSelect() {
  for (int i = 0; i < partMonth.length; i++) {
    partMonth[i] = i == month - 1;
  }
}

final List<bool> partDay = [false, true, false];
final List<bool> partMonth = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

final Set<DateTime> selectedDays = <DateTime>{};

const password = 'password';
const login = 'login';
const token = 'token';
var authToken = "";

BaseOptions options = BaseOptions(
  baseUrl: "",
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  headers: {'Authorization': 'Bearer $authToken'},
  contentType: 'application/json; charset=utf-8',
  responseType: ResponseType.json,
);

Dio dio = Dio(options);

Future<Response> auth(String login, String password) async {
  try {
    Map<String, String> data = {'email': login, 'password': password};
    var response = await dio.post(
      "https://wedding-halls-production.up.railway.app/auth",
      data: data,
    );
    return response;
  } on DioError catch (e) {
    return dio.post("path");
  }
}

Future<Response> weddingPost(
    String date,
    int number,
    String price,
    String paidPrice,
    String provideId,
    String phone,
    String name,
    String address,
    String extraInfo,
    String partOfDay,
    String status,
    bool verified) async {
  try {
    var data = {
      'date': date,
      'number_of_guests': number,
      'price': price,
      'paid_price': paidPrice,
      'provider_id': provideId,
      'phone_of_customer': phone,
      'customer_name': name,
      'address': address,
      'extra_info': extraInfo,
      'part_of_day': partOfDay,
      'status': status,
      'verified': verified.toString()
    };

    var response = await dio.post(
        "https://wedding-halls-production.up.railway.app/weddings",
        data: data);

    return response;
  } on DioError catch (e) {
    return dio.post("path");
  }
}

Future<Response> weddingsGetPartOfDay(
    String year, String month, String partOfDay) async {
  try {
    var parameters = {'year': year, 'month': month, 'part_of_day': partOfDay};

    var response = await dio.get(
        "https://wedding-halls-production.up.railway.app/weddings",
        queryParameters: parameters);

    return response;
  } on DioError catch (e) {
    return dio.get("path");
  }
}

Future<Response> weddingsGetDay(String year, String month, String day) async {
  try {
    var parameters = {'year': year, 'month': month, 'day': day};

    var response = await dio.get(
        "https://wedding-halls-production.up.railway.app/weddings/day",
        queryParameters: parameters);

    return response;
  } on DioError catch (e) {
    return dio.get("path");
  }
}

Future<Response> weddingsGetDebts(
    String offset, String limit, String currentPage) async {
  try {
    var parameters = {
      'offset': offset,
      'limit': limit,
      'currency_page': currentPage
    };

    var response = await dio.get(
        "https://wedding-halls-production.up.railway.app/weddings/day",
        queryParameters: parameters);

    return response;
  } on DioError catch (e) {
    return dio.get("path");
  }
}

Future<Response> weddingsGetNotVerified(
    String offset, String limit, String currentPage) async {
  try {
    var parameters = {
      'offset': offset,
      'limit': limit,
      'currency_page': currentPage
    };

    var response = await dio.get(
        "https://wedding-halls-production.up.railway.app/weddings/notVerified",
        queryParameters: parameters);

    return response;
  } on DioError catch (e) {
    return dio.get("path");
  }
}

Future<Response> weddingsGetId(String id) async {
  try {
    var response = await dio
        .get("https://wedding-halls-production.up.railway.app/weddings/$id");

    return response;
  } on DioError catch (e) {
    return dio.get("path");
  }
}

Future<Response> weddingPatch(
    String id,
    String date,
    int number,
    String price,
    String paidPrice,
    String provideId,
    String phone,
    String name,
    String address,
    String extraInfo,
    String partOfDay,
    String status,
    bool verified) async {
  try {
    var data = {
      'id': id,
      'date': date,
      'number_of_guests': number,
      'price': price,
      'paid_price': paidPrice,
      'provider_id': provideId,
      'phone_of_customer': phone,
      'customer_name': name,
      'address': address,
      'extra_info': extraInfo,
      'part_of_day': partOfDay,
      'status': status,
      'verified': verified.toString()
    };

    var response = await dio.patch(
        "https://wedding-halls-production.up.railway.app/weddings$id",
        data: data);

    return response;
  } on DioError catch (e) {
    return dio.post("path");
  }
}

Future<Response> weddingsDelete(String id) async {
  try {
    var response = await dio
        .delete("https://wedding-halls-production.up.railway.app/weddings/$id");

    return response;
  } on DioError catch (e) {
    return dio.get("path");
  }
}