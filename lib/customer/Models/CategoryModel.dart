// ignore_for_file: file_names, non_constant_identifier_names

class CategoryModell {
  final int id;
  final String name, description;
  final String photo;
  CategoryModell({
    required this.photo,
    required this.id,
    required this.name,
    required this.description,
  });
  factory CategoryModell.fromJson(JsonData) {
    return CategoryModell(
      id: JsonData['id'],
      name: JsonData['name'],
      description: JsonData['description'],
      photo: JsonData['photo'],
    );
  }
}
