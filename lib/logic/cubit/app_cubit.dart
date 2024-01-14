import 'package:acs_shop/models/customer.dart';
import 'package:acs_shop/services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    apiService = ApiService();
  }
  late ApiService apiService;
  late Customer customer;
  bool hidePassword = true;
  bool isRequesting = false;
}
