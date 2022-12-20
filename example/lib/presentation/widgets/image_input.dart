import 'package:flutter/material.dart';
import '../view_models/ig_view_model.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({
    super.key,
    required this.viewModel,
    required this.inputController,
    required this.formKey,
  });

  final IGViewModel viewModel;
  final TextEditingController inputController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: inputController,
          enabled: !(viewModel.loading ?? false),
          decoration: const InputDecoration(labelText: 'How do you imagine your image?'),
          validator: (value) {
            if (value?.isEmpty ?? false) {
              return 'Unleash your imagination';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        viewModel.loading ?? false
            ? const CircularProgressIndicator()
            : TextButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              viewModel.generateImage(inputController.text);
            }
          },
          child: const Text('Generate image'),
        ),
        const SizedBox(height: 20),
        viewModel.errorMessage != null
            ? Text(viewModel.errorMessage!, style: const TextStyle(color: Colors.red))
            : Container(),
      ],
    );
  }
}