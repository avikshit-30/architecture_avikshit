import 'package:architecture_avikshit/utils/generics/repo_generic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../custom_http_client/custom_exception.dart';
import '../logger.dart';
import 'model_factory.dart';

abstract class ServiceGeneric<M, R extends RepoGeneric,
    F extends ModelFactory<M>> {
  Ref ref;
  F? _factory;
  R get repoProvider;

  F get modelFactory => _factory ?? (_factory = createModelFactory());

  F createModelFactory();

  // TODO: REMOVE THIS. ONLY ADDED TEMP FOR TESTING
  bool get doesNotHaveDataTag => false;
  bool get listInsideDataTag => false;
  String get keyForData => 'results';

  ServiceGeneric({required this.ref});

  Future<void> getData() async {
    // throw CustomException.backStableError('hfiuewh');
    final repo = repoProvider;
    final response = await repo.getData();
    dynamic valueToPass;
    if (repo.isList || listInsideDataTag) {
      debugLog(DebugTags.apiResult, "red is $response");
      final List<M> temp = [];
      debugLog("Temp", "A");
      final elements = listInsideDataTag ? response[keyForData] : response;
      debugLog("Temp", "B");
      for (var elment in elements) {
        try {
          debugLog("Temp", "C");
          debugLog(DebugTags.apiResult, elment.toString());
          temp.add(modelFactory.fromMap(elment));
          debugLog("Temp", "D");
        } catch (e) {
          throw CustomException.modelParsingError(
              'Data Parsing Error ${e.toString()}');
        }
      }
      valueToPass = temp;
    } else {
      final M temp;
      try {
        if (doesNotHaveDataTag) {
          temp = modelFactory.fromMap(response);
        } else {
          temp = modelFactory.fromMap(response[keyForData]);
        }
      } catch (e) {
        throw CustomException.modelParsingError(e.toString());
      }
      valueToPass = temp;
    }
    debugLog(DebugTags.apiCall, 'call and parsing successful');
    repo.setValue(valueToPass);
    debugLog(DebugTags.apiCall, 'call and parsing successful');
  }
}
