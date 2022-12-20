import 'package:provider/provider.dart';
import 'package:open_ia/image_generate/data/data_sources/ig_data_source.dart';
import 'package:open_ia/image_generate/domain/repositories/ig_repository.dart';
import 'presentation/view_models/ig_view_model.dart';
import 'presentation/views/ig_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "lib/.env");
  final dataSource = IGDataSourceImpl(dotenv.env['API_KEY_OPEN_IA']!);
  final igRepository = IGRepositoryImpl(dataSource);

  runApp(
      ChangeNotifierProvider(
        create: (context) => IGViewModel(igRepository),
        child: const MaterialApp(home: IGImageGeneratorView()),
      ),
  );
}