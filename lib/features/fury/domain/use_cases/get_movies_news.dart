import 'package:dartz/dartz.dart';
import 'package:movies_application/features/fury/domain/repositories/base_movies_news_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/news_item.dart';

class GetMoviesNewsUseCase{
  final BaseMoviesNewsRepository baseMoviesNewsRepository;

  GetMoviesNewsUseCase(this.baseMoviesNewsRepository);

  Future<Either<Failure,NewsItem>> execute() async{
    return await baseMoviesNewsRepository.getMoviesNews();
  }
}