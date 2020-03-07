import 'dart:convert';

School schoolFromJson(String str) {
  final jsonData = json.decode(str);
  return School.fromJson(jsonData);
}

String schoolToJson(School data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<School> allSchoolsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<School>.from(jsonData.map((x) => School.fromJson(x)));
}

String allSchoolsToJson(List<School> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class School {
  int code;
  int censusYear;
  String address;
  double enemOverallAverage;
  String administrativeDependency;
  int countyCode;

  School({
    this.code,
    this.censusYear,
    this.address,
    this.enemOverallAverage,
    this.administrativeDependency,
    this.countyCode
  });

  factory School.fromJson(Map<String, dynamic> json) => new School(
    code: json["cod"],
    censusYear: json["anoCenso"],
    address: json["endereco"],
    enemOverallAverage: json["enemMediaGeral"],
    administrativeDependency: json["dependenciaAdministrativaTxt"],
    countyCode: json["codMunicipio"]
  );

  Map<String, dynamic> toJson() => {
    "cod": code,
    "anoCenso": censusYear,
    "endereco": address,
    "enemMediaGeral": enemOverallAverage,
    "dependenciaAdministrativaTxt": administrativeDependency,
    "codMunicipio": countyCode
  };
}