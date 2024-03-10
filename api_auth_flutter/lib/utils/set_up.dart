import 'package:api_auth_flutter/data/data_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setup() async {
  GetIt.instance.registerSingleton<AllData>(AllData());
}
