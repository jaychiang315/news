class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  //factory function to map the json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
