import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  Map<String, List<String>> provinceNames = {
    'Bangkok': ['Ton', 'Tea'],
    'Phuket': ['Ja', 'Eye'],
  };

  List<String> allNames = [];

  @override
  void initState() {
    super.initState();
    for (List<String> names in provinceNames.values) {
      allNames.addAll(names);
    }
  }

  void addName() {
    String newName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Name'),
          content: TextFormField(
            onChanged: (value) {
              newName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newName.isNotEmpty) {
                  setState(() {
                    allNames.add(newName);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void deleteName(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete ${allNames[index]}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  allNames.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: provinceNames.length + 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              ...provinceNames.keys.map((province) {
                return Tab(text: province);
              }).toList(),
              Tab(text: 'All Names'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ...provinceNames.keys.map((province) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: provinceNames[province]!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(provinceNames[province]![index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteName(
                                  allNames.indexOf(provinceNames[province]![index]));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addName();
                    },
                    child: Text('Add Name'),
                  ),
                ],
              );
            }).toList(),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: allNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(allNames[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteName(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    addName();
                  },
                  child: Text('Add Name'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

