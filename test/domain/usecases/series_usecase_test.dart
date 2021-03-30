import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_comics_app/domain/entities/serie.dart';
import 'package:marvel_comics_app/domain/repositories/series_repository.dart';
import 'package:marvel_comics_app/domain/usecases/series_use_case.dart';
import 'package:mocktail/mocktail.dart';

class SeriesRepositoryMock extends Mock implements SeriesRepository {}

void main() {
  SeriesUseCase useCase;
  SeriesRepositoryMock repository;
  Serie serie;

  setUp(() {
    repository = SeriesRepositoryMock();
    useCase = SeriesUseCase(repository);
    serie = Serie(
      id: 1,
      title: "Avengers",
      thumbnailURL: "htttp://www.google.com"
    );
  });

  group("Series Use Case Test:", () {
    test("Should return empty list", () async {
      when(() => repository.getSeries()).thenAnswer((_) async => <Serie>[]);
      expect((await useCase.getSeries()).isEmpty, equals(true));
      verify(() => repository.getSeries()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test("Should return not empty list", () async {
      when(() => repository.getSeries()).thenAnswer((_) async => <Serie>[serie, serie, serie]);
      expect((await useCase.getSeries()).isNotEmpty, equals(true));
      verify(() => repository.getSeries()).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
