import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_bloc/core/l10n/l10n.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.item, super.key});
  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 12,
        children: [
          Flexible(
            child: Image.network(
              item.thumbnail,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            item.description,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            '${context.l10n.price}: ${item.price}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
