import 'package:vishal_mega_mart_app/screens/apis/categoryapi.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';

class Repository {
  final categoryprovider = CategoryProvider();
  Future<CategorySection> getallcategory() => categoryprovider.getcategory();

  
}
