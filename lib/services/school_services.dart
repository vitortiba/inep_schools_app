import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:inepschoolsapp/models/school_model.dart';

String url = 'http://educacao.dadosabertosbr.com/api/escola';

Future<School> getSchool(code) async{
  final response = await http.get('$url/$code');
  return schoolFromJson(response.body);
}
