import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../screens/dashboard/dashboard_screen.dart';
import '../../../screens/login_screen.dart';
import '../../api_folder/auth_api.dart';
import '../../connect_end/contract/contract_implementation.dart';
import '../../connect_end/repo/repo_implementation.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../manager/shared_preferance.dart';
import '../network/network_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginScreen, initial: true),
    MaterialRoute(page: Dashboard, initial: false),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: AuthApi),
    LazySingleton(classType: AuthContractsImpl),
    LazySingleton(classType: AuthRepoImpl),
    LazySingleton(classType: AuthViewModel),
  ],
  logger: StackedLogger(),
)
class App {}
