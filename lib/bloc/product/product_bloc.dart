import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../respon/product/product_resp.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRes _productRes;

  ProductBloc({required ProductRes productRes})
      : _productRes = productRes,
        super(ProductLoading()) {
    on<LoadProducts>(_mapLoadProducts);
    on<UploadProducts>(_mapUploadProducts);
  }

  void _mapLoadProducts(event, emit) {
    _productRes
        .getAllproduct()
        .listen((products) => add(UploadProducts(products)));
  }

  void _mapUploadProducts(event, emit) {
    emit(ProductLoaded(products: event.products));
  }
}