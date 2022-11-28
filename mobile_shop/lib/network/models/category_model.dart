class CategoryModel {
  int? count;
  int? totalPages;
  int? perPage;
  int? currentPage;
  List<Results>? results;

  CategoryModel(
      {this.count,
      this.totalPages,
      this.perPage,
      this.currentPage,
      this.results});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalPages = json['total_pages'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}


class Results {
  String? name;
  String? icon;

  Results({this.name, this.icon});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }
}