import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custome_button.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custome_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, description, code;
  late num price;
  File? image;
  bool isFeatured = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomeTextFormField(
                hintText: "Product Name",
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16),

              CustomeTextFormField(
                hintText: "Product Price",
                textInputType: TextInputType.number,
                onSaved: (value) {
                  price = num.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              CustomeTextFormField(
                hintText: "Product Code",
                textInputType: TextInputType.number,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              const SizedBox(height: 16),
              CustomeTextFormField(
                hintText: "Product Description",
                textInputType: TextInputType.text,
                onSaved: (value) {
                  description = value!;
                },
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(height: 24),
              CustomeButton(
                onPressed: () {
                  if (image != null) {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity inputEntity = AddProductInputEntity(
                        name: name,
                        description: description,
                        price: price,
                        image: image!,
                        iFeatured: isFeatured,
                      );
                    }
                  } else {
                    showError(context);
                  }
                },
                text: "Add Product",
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Please select an image")));
  }
}
