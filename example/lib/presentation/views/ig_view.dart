import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/ig_view_model.dart';
import '../widgets/image_input.dart';
import '../widgets/image_output.dart';

class IGImageGeneratorView extends StatefulWidget {
  const IGImageGeneratorView({super.key});

  @override
  IGImageGeneratorViewState createState() => IGImageGeneratorViewState();
}

class IGImageGeneratorViewState extends State<IGImageGeneratorView> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<IGViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator with OpenIA'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ImageInput(
                  viewModel: viewModel,
                  inputController: _inputController,
                  formKey: _formKey,
                ),
                const SizedBox(height: 20),
                ImageOutput(viewModel: viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}