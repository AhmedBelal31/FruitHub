import 'package:fruit_hub/features/login/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/login/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repos/auth_repo_impl.dart';
import 'firebase_auth_service.dart';

class GetItService {
  static final getIt = GetIt.instance;

  static Future<void> setup() async {
    //Register Firebase Auth Service
    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

    //Register Auth Repo
    getIt.registerLazySingleton<AuthRepo>( ()=>
        AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()));


  }
}
