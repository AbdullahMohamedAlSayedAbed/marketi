import 'package:flutter/material.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/details/presentation/views/widgets/custom_dot_ind_details.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';
import 'package:provider/provider.dart';

class PageViewDetailsProduct extends StatefulWidget {
  const PageViewDetailsProduct({super.key});

  @override
  State<PageViewDetailsProduct> createState() => _PageViewDetailsProductState();
}

class _PageViewDetailsProductState extends State<PageViewDetailsProduct> {
  late final PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _controller.addListener(() {
      final page = _controller.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() => _currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = context.read<Product>();
    final images = product.images ?? [];

    return Column(
      spacing: 11,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .3,
          child: PageView.builder(
            itemCount: images.length,
            controller: _controller,
            itemBuilder: (context, index) {
              return CustomNetworkImage(imageUrl: images[index]);
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return CustomDotIndDetails(isActive: _currentPage == index);
          }),
        ),

        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: CustomNetworkImage(imageUrl: images[index]).paddingOnly(
                  left: 14),
              );
            },
          ),
        ),
      ],
    );
  }
}


