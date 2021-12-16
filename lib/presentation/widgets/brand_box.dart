import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class BrandBox extends StatelessWidget {
  const BrandBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: kIsWeb ? 400 : MediaQuery.of(context).size.width),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset("assets/images/icon.jpg")),
                const SizedBox(width: 10),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SelectableText(
                      'smartdish',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            SelectableText(
              'Share your dishes with smartdish!',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
