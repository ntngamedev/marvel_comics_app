import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';
import 'package:marvel_comics_app/domain/repositories/comics_repository.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:mocktail/mocktail.dart';

class ComicsRepositoryMock extends Mock implements ComicsRepository {}

void main() {
  ComicsUseCase useCase;
  ComicsRepositoryMock repository;
  Comic comic;

  setUp(() {
    repository = ComicsRepositoryMock();
    useCase = ComicsUseCase(repository);
    comic = Comic(
      id: 1,
      title: "Spider-Man",
      thumbnailURL: "htttp://www.google.com",
      price: 3.99
    );
  });

  group("Comics Use Case Test:", () {
    test("Should return empty list", () async {
      when(() => repository.getComics()).thenAnswer((_) async => <Comic>[]);
      expect((await useCase.getComics()).isEmpty, equals(true));
      verify(() => repository.getComics()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test("Should return not empty list", () async {
      when(() => repository.getComics()).thenAnswer((_) async => <Comic>[comic, comic, comic]);
      expect((await useCase.getComics()).isNotEmpty, equals(true));
      verify(() => repository.getComics()).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
