import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final PageViewModel pageViewModel;
  final double percentVisible;

  const CustomPage({Key key, this.pageViewModel, this.percentVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageViewModel.color,
        child: Opacity(
          opacity: percentVisible,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                height: 150,
              ),
              Container(
                child: pageViewModel.icon,
              ),
              Divider(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  pageViewModel.title.toString(),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                  pageViewModel.subTitle.toString(),
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String title;
  final Icon icon;
  final String subTitle;

  const PageViewModel(this.color, this.title, this.icon, this.subTitle);
}
