import 'package:intl/intl.dart';

class Helper {
  static const double hPadding = 20.0;
  static const bookPlaceholder =
      'https://kimslater.com/wp-content/uploads/2010/08/blank-cover.png';

  static String dateSerializer(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(date);
  }

  static DateTime? dateDeserializer(String iso8601date) {
    return DateTime.tryParse(iso8601date);
  }

  static String datePresenter(DateTime? date) {
    return DateFormat('d MMM, yyyy').format(date ?? DateTime.now());
  }
}
