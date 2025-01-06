import 'package:get/get.dart';

part 'languages/ar.dart';
part 'languages/en.dart';
part 'languages/ku.dart';

class KhelwaTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'ar': _ar,
      'en': _en,
      'ku': _ku,
    };
  }
}
