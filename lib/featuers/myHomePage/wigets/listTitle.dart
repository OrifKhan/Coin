import 'package:flutter/material.dart';

import '../../../repositories/crytioCoint/coint.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    super.key,
    required this.cryptoCoin,
  });
  final CryptoCoin cryptoCoin;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(cryptoCoin.imagmeUrl),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      title: Text(
        cryptoCoin.name,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        cryptoCoin.priceInUSD.toString(),
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: cryptoCoin);
      },
    );
  }
}
