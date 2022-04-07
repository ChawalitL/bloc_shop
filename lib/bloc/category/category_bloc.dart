import 'package:bloc/bloc.dart';
import 'package:bloc_provider/respon/category/catagory_resp.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRes _categoryRes;

  CategoryBloc({required CategoryRes categoryRes})
      : _categoryRes = categoryRes,
        super(CategoryLoading()) {
    on<LoadCategories>(_mapLoadcategories);
    on<UploadCategories>(_mapUploadcategories);
  }

  void _mapLoadcategories(event, emit) {
    _categoryRes
        .getAllcategories()
        .listen((categories) => add(UploadCategories(categories)));
  }

  void _mapUploadcategories(event, emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
