class Category {
  int? id;
  String? name;
  Category({this.id, required this.name});

  
  Category.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
  }

  toMap() {
    return {
      "name": name,
    };
  }


}