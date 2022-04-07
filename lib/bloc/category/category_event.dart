part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UploadCategories extends CategoryEvent {
  final List<Category> categories;

  UploadCategories(this.categories);

  @override
  List<Object> get props => [categories];
}
