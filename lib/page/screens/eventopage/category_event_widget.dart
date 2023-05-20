import 'package:flutter/material.dart';
import 'package:my_money/page/widgets/iconcategory_event_widget.dart';

class CategoryEventWidget extends StatefulWidget {
  const CategoryEventWidget({Key? key}) : super(key: key);

  @override
  State<CategoryEventWidget> createState() => _CategoryEventWidgetState();
}

class _CategoryEventWidgetState extends State<CategoryEventWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.2,
        width: width,
        child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Ferias'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'lazer'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Investimento'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Role'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Viagem'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Saúde'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Alimentação'),
              IconcategoryEventWidget(
                  icon: Icons.abc_rounded, namecategory: 'Trabalho')
            ],
          ),
        ));
  }
}
