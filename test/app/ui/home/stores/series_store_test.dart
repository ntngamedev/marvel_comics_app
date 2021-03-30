import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_comics_app/app/ui/home/stores/series_store.dart';
import 'package:marvel_comics_app/domain/entities/serie.dart';
import 'package:marvel_comics_app/domain/usecases/series_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

class SerieUseCaseMock extends Mock implements SeriesUseCase {}

void main() {
  SeriesUseCase seriesUseCase;
  SeriesStore seriesStore;
  Serie serie;

  setUpAll(() {
    seriesUseCase = SerieUseCaseMock();
    seriesStore = SeriesStore(seriesUseCase);
    serie = Serie(
      id: 1,
      title: "Spider-Man",
      thumbnailURL: "htttp://www.google.com",
    );
  });

  group("Series Store Test:", () {
    storeTest<SeriesStore>(
      "Should return empty list",
      build: () {
        when(() => seriesUseCase.getSeries()).thenAnswer((_) async => <Serie>[]);
        return seriesStore;
      },
      act: (store) => store.load(),
      expect: () => [isEmpty, tripleLoading, isEmpty],
    );

    storeTest<SeriesStore>(
      "Should return not empty list",
      build: () {
        when(() => seriesUseCase.getSeries()).thenAnswer((_) async => <Serie>[serie, serie]);
        return seriesStore;
      },
      act: (store) => store.load(),
      expect: () => [isEmpty, tripleLoading, isNotEmpty],
    );
  });
}
