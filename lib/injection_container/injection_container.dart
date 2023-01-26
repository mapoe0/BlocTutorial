import 'package:get_it/get_it.dart';
import 'package:tuto_app/injection_container/injection_container_joke.dart'
    as di_joke;

final sl = GetIt.instance;

Future<void> init() async {
  di_joke.initJoke(sl);
}
