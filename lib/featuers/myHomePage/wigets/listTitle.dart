import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    super.key,
    required this.coinName,
    required this.priceInUSD,
  });
  final String coinName;
  final double priceInUSD;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(
          'assets/bitcoin.png',
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        "$priceInUSD\$",
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
    );
  }
}
