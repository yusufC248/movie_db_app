class Movie {

  int? id;
  bool? video;
  String? title;
  String? posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  String? overview;
  DateTime? releaseDate;

  Movie(
      {
        this.id,
        this.video,

        this.title,

        this.posterPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.backdropPath,
        this.overview,
        this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];

    title = json['title'];

    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    overview = json['overview'];
    releaseDate = DateTime.parse(json['release_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;

    data['title'] = this.title;

    data['poster_path'] = this.posterPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}