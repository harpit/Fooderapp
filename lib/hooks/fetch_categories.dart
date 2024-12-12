import 'package:foodapp/Constants/constant.dart';
import 'package:foodapp/models/apiError.dart';
import 'package:foodapp/models/categories.dart';
import 'package:foodapp/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchCategories() {
  final categoriesItems = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/category/random');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        categoriesItems.value = categoriesModelFromJson(response.body);
      } else {
        appiError.value = apiErrorFromJson(response.body);
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      error.value = e as Exception;
      print('Exception occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: categoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
