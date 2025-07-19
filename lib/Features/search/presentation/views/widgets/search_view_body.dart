import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';

  void _onSearch() {
    setState(() {
      _searchText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          CustomSearchTextField(
            onSearch: _onSearch,
            textEditingController: _controller,
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, bottom: 20),
            child: Text(
              'Result Search',
              style: Style.textStyle18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: SearchResultListView(
                  search: _searchText,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
