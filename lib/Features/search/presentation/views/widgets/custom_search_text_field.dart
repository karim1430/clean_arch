import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onSearch;

  const CustomSearchTextField({
    super.key,
    required this.textEditingController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onSubmitted: (_) => onSearch(),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onSearch,
          icon: const Icon(Icons.search),
        ),
        label: const Text('Search'),
        hintText: 'Enter Book Name',
        enabledBorder: methodOutlineBorder(),
        focusedBorder: methodOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder methodOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
