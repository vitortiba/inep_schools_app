import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:inepschoolsapp/models/school_model.dart';
import 'dart:io';

String url = 'http://educacao.dadosabertosbr.com/api/escola';

Future<School> getSchool() async{
  final response = await http.get('$url/1');
  return schoolFromJson(response.body);
}
