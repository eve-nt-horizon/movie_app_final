import 'package:movie/app/app.locator.dart';
import 'package:movie/services/api_service.dart';
import 'package:stacked/stacked.dart';

class AllGenresViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  List<Map<int, String>> allGenres = [];
  void runStartupLogic() async {
    var res = await _apiService.allGenres();
    print(res);
  }
}
