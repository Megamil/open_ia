import 'package:flutter/cupertino.dart';
import '../view_models/ig_view_model.dart';

class ImageOutput extends StatelessWidget {
  const ImageOutput({
    super.key,
    required this.viewModel,
  });

  final IGViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return viewModel.imageUrl != null
        ? Image.network(viewModel.imageUrl!)
        : Container();
  }
}