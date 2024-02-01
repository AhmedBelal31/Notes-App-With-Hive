import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomTextFormField(
              hint: 'Title',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomTextFormField(
                hint: 'Content',
                maxLine: 5,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text(
                  'Add',
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
