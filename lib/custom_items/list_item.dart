import 'package:flutter/material.dart';
import 'package:flutter_stocks_app/custom_pages/company_page.dart';

class CustomListItem extends StatelessWidget {
  final Map stock;

  CustomListItem(this.stock);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CompanyPage(stock["symbol"])));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: 50.0,
                child: Text(
                  stock["symbol"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            /*Icon(
              stock["changePercent"] >= 0
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: stock["changePercent"] >= 0 ? greenAccent : redAccent,
            ),*/
            SizedBox(
              width: 4.0,
            ),
            Text(
              (stock["changePercent"] >= 0
                      ? "+" + stock["changePercent"].toString()
                      : stock["changePercent"].toString()) +
                  "%",
              style: Theme.of(context).textTheme.body2.copyWith(
                    color: stock["changePercent"] >= 0
                        ? Theme.of(context).accentColor
                        : Theme.of(context).errorColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
