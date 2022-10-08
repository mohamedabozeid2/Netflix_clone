import 'package:movies_application/core/api/dio_helper.dart';

class MovieModel{
  String? name;
  int? id;
  String? language;
  bool? isAdult;
  String? description;
  String? posterPath;
  String? releaseDate;
  num? rate;
  String? backDropPath;

  MovieModel({
    required this.name,
    required this.id,
    required this.description,
    required this.rate,
    required this.backDropPath,
    required this.isAdult,
    required this.language,
    required this.posterPath,
    required this.releaseDate
});

  MovieModel.fromJson(Map<String, dynamic> json){
      name = json['original_title'];
      id = json['id'];
      language = json['original_language'];
      description = json['overview'];
      rate = json['vote_average'];
      backDropPath = json['backdrop_path'];
      posterPath = json['poster_path'];
      isAdult = json['adult'];
      releaseDate = json['release_date'];
  }

  String posterURL(){
    return '${DioHelper.baseImageURL}$posterPath';
  }


}