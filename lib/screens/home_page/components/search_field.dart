import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:my_flutter1/models/Product.dart';


class SearchBarApp extends StatefulWidget {
  List<Product> product;


  SearchBarApp({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();

}

class _SearchBarAppState extends State<SearchBarApp> {
  final SearchController controller = SearchController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(useMaterial3: true);
    return Column(
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth * 0.7,
              decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              ),
              child: SearchAnchor(
                searchController: controller,
                builder: (BuildContext context, SearchController controller) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      controller.openView();
                    },
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(3, (int index) {
                    final String item = widget.product[index].title;
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),),
            Center(
              child: controller.text.isEmpty
                  ? const Text('No item selected')
                  : Text('Selected item: ${controller.value.text}'),
            ),
          ],
    );
  }
}



// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // SearchAnchor(
//         //     searchController: controller,
//         //     builder: (BuildContext context, SearchController controller) {
//         //       return IconButton(
//         //         icon: const Icon(Icons.search),
//         //         onPressed: () {
//         //           controller.openView();
//         //         },
//         //       );
//         //     },
//         //     suggestionsBuilder:
//         //         (BuildContext context, SearchController controller) {
//         //       return List<ListTile>.generate(5, (int index) {
//         //         final String item = 'item $index';
//         //         return ListTile(
//         //           title: Text(item),
//         //           onTap: () {
//         //             setState(() {
//         //               controller.closeView(item);
//         //             });
//         //           },
//         //         );
//         //       });
//         //     }),
//         // Center(
//         //   child: controller.text.isEmpty
//         //       ? const Text('No item selected')
//         //       : Text('Selected item: ${controller.value.text}'),
//         // ),
//         Container(
//           width: SizeConfig.screenWidth * 0.7,
//           decoration: BoxDecoration(
//             color: kSecondaryColor.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: TextField(
//             onChanged: (value) => print(value),
//             decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                     horizontal: getProportionateScreenWidth(20),
//                     vertical: getProportionateScreenWidth(9)),
//                 border: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 hintText: "Search product",
//                 prefixIcon: Icon(Icons.search)),
//           ),
//         ),
//       ],
//     );
//   }
// }

