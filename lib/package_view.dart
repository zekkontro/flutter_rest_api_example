import 'package:flutter/material.dart';
import 'package:flutter_rest_api_example/api_service.dart';
import 'package:flutter_rest_api_example/package_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageView extends StatefulWidget {
  final String packageName;

  const PackageView({Key key, this.packageName}) : super(key: key);
  @override
  _PackageViewState createState() => _PackageViewState();
}

class _PackageViewState extends State<PackageView> {
  APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<PackageModel>(
            future: apiService.getPackageInformaitons(widget.packageName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data;
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data.packageName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(data.popularity),
                              SizedBox(
                                width: 20,
                              ),
                              Text(data.pubPoint),
                              SizedBox(
                                width: 20,
                              ),
                              Text(data.likeCount.toString())
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      data.packageDescription,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: data.packageVersions
                            .map<Widget>((e) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(e),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Paket Sahibi: " + data.packageAuthor,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Paket Lisansı: " + data.packageLicense,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      launch("https://pub.dev/packages/" + data.packageName);
                    },
                    child: Text("PAKET SAYFASI"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      launch(data.githubLink);
                    },
                    child: Text("GITHUB REPOSU"),
                  )
                ],
              );
            }),
      ),
    );
  }
}
