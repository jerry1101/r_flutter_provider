import 'package:flutter/material.dart';
import 'package:r_flutter_provider/shared/shared.dart';
import '../models/models.dart';
import '../views/details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  _SearchViewlState createState() => _SearchViewlState();
}

class _SearchViewlState extends State<SearchView> {
  final _urlController = TextEditingController();
  final _domainController = TextEditingController();
  String dropdownValue = 'Mobile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('SEO Checker'),
          backgroundColor: Theme.of(context).primaryColor),
      body: Container(
        margin: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Image.network(
              'https://freerangestock.com/thumbnail/119557/web-developer--web-development--programmer--programming.jpg',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: _buildUserAgentType(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: _buildDomain(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: _buildUrl(),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: _buildRaisedButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRaisedButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
          color: Theme.of(context).buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Theme.of(context).accentColor)),
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Text('Analyze',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailView(
                      requestInput: SearchOptions(
                          userAgentVersion: dropdownValue,
                          domain: _domainController.text,
                          uri: _urlController.text))),
            );
          }),
    );
  }

  Widget _buildUrl() {
    return TextField(
      controller: _urlController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2,
          labelText: 'URL',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Enter a Url'),
    );
  }

  Widget _buildDomain() {
    return TextField(
      controller: _domainController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2,
          labelText: 'Domain',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Enter a Domain'),
    );
  }

  Widget _buildUserAgentType() {
    return Container(
      width: 30,
      height: 60,
      padding: EdgeInsets.only(left: 250, right: 50),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.bodyText2,
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: UserAgent.types.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      ),
    );
  }
}
