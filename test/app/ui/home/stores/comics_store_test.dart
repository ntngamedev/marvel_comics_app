import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvel_comics_app/app/ui/home/stores/comics_store.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class ComicsUseCaseMock extends Mock implements ComicsUseCase {}

void main() {
  ComicsUseCase comicsUseCase;
  ComicsStore comicsStore;
  Comic comic;

  setUpAll(() {
    comicsUseCase = ComicsUseCaseMock();
    comicsStore = ComicsStore(comicsUseCase);
    comic = Comic(
      id: 1,
      title: "Spider-Man",
      thumbnailURL: "htttp://www.google.com",
      price: 3.99,
    );
  });

  group("Comics Store Test:", () {
    storeTest<ComicsStore>(
      "Should return empty list",
      build: () {
        when(() => comicsUseCase.getComics()).thenAnswer((_) async => <Comic>[]);
        return comicsStore;
      },
      act: (store) => store.load(),
      expect: () => [isEmpty, tripleLoading, isEmpty],
    );

    storeTest<ComicsStore>(
      "Should return not empty list",
      build: () {
        when(() => comicsUseCase.getComics()).thenAnswer((_) async => <Comic>[comic, comic]);
        return comicsStore;
      },
      act: (store) => store.load(),
      expect: () => [isEmpty, tripleLoading, isNotEmpty],
    );
  });
}
