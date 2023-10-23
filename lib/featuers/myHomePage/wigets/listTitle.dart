import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) {
          final coinName = 'Bitcoin';
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
              coinName + i.toString(),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "2000\$",
              style: theme.textTheme.labelSmall,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/coin', arguments: coinName + i.toString());
            },
          );
        });
  }
}
