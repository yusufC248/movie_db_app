class NewMovie {
  int? page;
  int? totalResults;
  int? totalPages;
  List<Results>? results;
  NewMovie({this.page, this.totalResults, this.totalPages, this.results});
  NewMovie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      // ignore: prefer_collection_literals, unnecessary_new, deprecated_member_use
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Results {
  String? posterPath;
  int? id;
  String? title;
  Results(
      {
        this.posterPath,
        this.id,
        this.title,
      });
  Results.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    title = json['title'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}