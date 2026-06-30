import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nax_bull_trade/spleash_screen.dart';
import 'View/auth_view/auth_bloc/auth_bloc.dart';
import 'View/dashboard_view/dashboard_bloc/dashboard_bloc.dart';
import 'app_helpers/network/api_base_helper.dart';
import 'app_helpers/network/api_client.dart';
import 'app_helpers/network/network_class.dart';
import 'app_helpers/utils/shared_preferences.dart';


SpUtil? sp;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dioClient = DioClient(/*storage*/);
  final apiClient = ApiClient(dioClient.dio);
  final authRepository = AuthRepository(apiClient /*storage*/);
  sp = await SpUtil.getInstance();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider<DashboardBloc>(
            create: (context) => DashboardBloc(context.read<AuthRepository>()),
          ),

        ],
        child: const HrmsApp(),
      ),
    ),
  );
}

class HrmsApp extends StatelessWidget {
  const HrmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nax_bull',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: FirstSplash(),
    );
  }
}
