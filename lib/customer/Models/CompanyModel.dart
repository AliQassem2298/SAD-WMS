// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

class Company_Model {
  final int id;
  final String name, photo;
  Company_Model({
    required this.id,
    required this.name,
    required this.photo,
  });
  factory Company_Model.fromJson(JsonData) {
    return Company_Model(
      id: JsonData['id'],
      name: JsonData['name'],
      photo: JsonData['photo'],
    );
  }
}
