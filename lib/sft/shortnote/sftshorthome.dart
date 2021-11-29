import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_downloader_example/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../main.dart';

class Sftshorthome extends StatefulWidget with WidgetsBindingObserver {
  final TargetPlatform? platform;

  Sftshorthome({Key? key, this.title, this.platform}) : super(key: key);

  final String? title;

  @override
  _SftshorthomeState createState() => new _SftshorthomeState();
}

class _SftshorthomeState extends State<Sftshorthome> {
  final _documents = [
    {
      'name': " ක්ෂුද්‍ර ජීව විද්‍යාව",
      'link':
          'https://drive.google.com/uc?export=download&id=13XGx_bJvpvJ7sMSeaLJQ7ELdGA0xSLuj'
    },
    {
      'name': 'සංඛ්‍යානය',
      'link':
          'https://drive.google.com/uc?export=download&id=1X7R6fmFsFZXqllgd0SL0h0eMqusKIGwr'
    },
    {
      'name': 'කාර්යය,ජවය,ශක්තිය_සහ_ක්ෂමතාව',
      'link':
          'https://drive.google.com/uc?export=download&id=186zMJPX7nNUJAG99vPxwNgwrXlGKAJ2F'
    },
    {
      'name': 'පදාර්ථයේ යාන්තික ගුණ',
      'link':
          'https://drive.google.com/uc?export=download&id=16_TgtSJdPn_EI6nVYvp9-yygaxx8GG3v'
    },
    {
      'name': "පයිතගරස් සම්බන්ධතාව",
      'link':
          'https://drive.google.com/uc?export=download&id=1mV-0y6Lkwrhh9OVMiBQ8DK0NTHLeL5vg'
    },
    {
      'name': "රසායනික කර්මාන්ත",
      'link':
          'https://drive.google.com/uc?export=download&id=1KexySPHs3SnLvvS0IZGqmQmfYx4KYen9'
    },
    {
      'name': "වර්ගඵලය හා පරිමාව",
      'link':
          'https://drive.google.com/uc?export=download&id=1eKfBQh8XgMAoI1C9cJ53gT-NyRAOx0eP'
    },
    {
      'name': "වෘත්තාකාර හා භ්‍රමණ චලිතය",
      'link':
          'https://drive.google.com/uc?export=download&id=19Cv-Dp3qn2QOgdydWDwOmWTEAWwxy3PJ'
    },
    {
      'name': 'ද්‍රවස්ථිතිය ',
      'link':
          'https://drive.google.com/uc?export=download&id=1pDZ7sIxi33fZjECqnDGuq8CekZ5Qir9K'
    },
    {
      'name': " ස්වභාව නිෂ්පාදන",
      'link':
          'https://drive.google.com/file/d/1J4ivXJdxfpwVr7pAYjzp1RYuhlM2Nc3o/view?usp=sharing'
    },
    {
      'name': "තාප රසායනය ",
      'link':
          'https://drive.google.com/uc?export=download&id=1XgOA_9zVqRWbNmcGl9CoxlmMaQSWliS0'
    },
    {
      'name': "ත්‍රිකෝණමිතිය",
      'link':
          'https://drive.google.com/uc?export=download&id=1amzzPvao5GI066bJ0cOnmXW6ITZ0h1Yq'
    },
    {
      'name': " බලය",
      'link':
          'https://drive.google.com/uc?export=download&id=179ECYbh9pqHuWS_xg75quwe9udFu_hoC'
    },
    {
      'name': " මිනුම් උපකරණ",
      'link':
          'https://drive.google.com/uc?export=download&id=1JbxlDx0TyidvFx2gwqGlwKjV3OHpAYHy'
    },
    {
      'name': " වනාන්තර ",
      'link':
          'https://drive.google.com/uc?export=download&id=11JPB6_6pRp9c_8pUAI-O8ilSEAHVCDAY'
    },
    {
      'name': " විද්‍යුතය",
      'link':
          'https://drive.google.com/uc?export=download&id=1NC-kGcC3W7Qpbx6_YF7azrkI_iGQRSeo'
    },
    {
      'name': " අණුක ජීව විද්‍යාව ",
      'link':
          'https://drive.google.com/uc?export=download&id=1VEWh6gBh6zxs2eWH_8mpdXsE_PtjDomD'
    },
    {
      'name': " බහු අවයවික  ",
      'link':
          'https://drive.google.com/uc?export=download&id=1_AVtLk7hAQmEiKo4KQfF3Y4pwA6pbgHH'
    },
    {
      'name': "තාපය ",
      'link':
          'https://drive.google.com/uc?export=download&id=1gJ1G8b4VUAOFiSSIs0rhyR9HhOH6Af0f'
    },
    {
      'name': "chalaka rasayanaya ",
      'link':
          'https://drive.google.com/uc?export=download&id=1NGqCLoJRYp0UjZ5ufhAwEM3HLvEOd_ih'
    },
    {
      'name': "karya ha shamathawaya ",
      'link':
          'https://drive.google.com/uc?export=download&id=1qfQu1x__CMpKcv3d432ZahjUJIdr-VBk'
    },
    {
      'name': "unit 21 පරිගණකය",
      'link':
          'https://drive.google.com/uc?export=download&id=19tuNYtsBgXRS8dweF3dj4jh7ZUnExCc8'
    },
    {
      'name': " unit 22 පරිගණක මෙහෙයුම්_පද්ධතිය ",
      'link':
          'https://drive.google.com/uc?export=download&id=13dKgBHlJXeuWJVFPybGv9J5-rRjos9RN'
    },
    {
      'name': " unit 23 යෙදුම් මෘදුකාංග භාවිතය ",
      'link':
          'https://drive.google.com/uc?export=download&id=1Ss9rXZBpegMm0JngDPWCLQCSqPgjjkYe'
    },
    {
      'name': "unit 24 අන්තර්ජාලය සහ සන්නිවේදනය",
      'link':
          'https://drive.google.com/uc?export=download&id=1z8nMj6VFlbZ_gq95dsTQs1pO95Y0nPXE'
    },
    {
      'name': "ඛණ්ඩාංක ජ්‍යාමිතිය",
      'link':
          'https://drive.google.com/uc?export=download&id=1tmujQ76NKe1nLhy8mDabZB_TzpKSuA7I'
    },
  ];

  List<_TaskInfo>? _tasks;
  late List<_ItemHolder> _items;
  late bool _isLoading;
  late bool _permissionReady;
  late String _localPath;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    _prepare();
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (debug) {
        print('UI Isolate Callback: $data');
      }
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int? progress = data[2];

      if (_tasks != null && _tasks!.isNotEmpty) {
        final task = _tasks!.firstWhere((task) => task.taskId == id);
        setState(() {
          task.status = status;
          task.progress = progress;
        });
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: new Scaffold(
          bottomNavigationBar: Container(
            color: HexColor("#29335C"),
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(1.0),
            child: AdWidget(
              key: UniqueKey(),
              ad: AdManager.createBannerAd()..load(),
            ),
          ),
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: new Text(
            widget.title!,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              HexColor("#29335C"),
              HexColor("#29335C"),
            ])),
          ),
        ),
        
        body: Column(
          children: [
            ///kkkakkakakkaakkkakak
            ///
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/exam.PNG"), fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Builder(
                    builder: (context) => _isLoading
                        ? new Center(
                            child: new CircularProgressIndicator(),
                          )
                        : _permissionReady
                            ? _buildDownloadList()
                            : _buildNoPermissionWarning()))
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadList() => Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: _items
              .map((item) => item.task == null
                  ? _buildListSection(item.name!)
                  : DownloadItem(
                      data: item,
                      onItemClick: (task) {
                        _openDownloadedFile(task).then((success) {
                          if (!success) {
                            // ignore: deprecated_member_use
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Cannot open this file')));
                          }
                        });
                      },
                      onActionClick: (task) {
                        if (task.status == DownloadTaskStatus.undefined) {
                          _requestDownload(task);
                        } else if (task.status == DownloadTaskStatus.complete) {
                          _delete(task);
                        } else if (task.status == DownloadTaskStatus.failed) {
                          _retryDownload(task);
                        }
                      },
                    ))
              .toList(),
        ),
      );

  Widget _buildListSection(String title) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18.0),
        ),
      );

  Widget _buildNoPermissionWarning() => Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Please grant accessing storage permission to continue -_-',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    _retryRequestPermission();
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      );

  Future<void> _retryRequestPermission() async {
    final hasGranted = await _checkPermission();

    if (hasGranted) {
      await _prepareSaveDir();
    }

    setState(() {
      _permissionReady = hasGranted;
    });
  }

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
        url: task.link!,
        headers: {"auth": "test_for_sql_encoding"},
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true);
  }

  // ignore: unused_element

  void _retryDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo? task) {
    if (task != null) {
      return FlutterDownloader.open(taskId: task.taskId!);
    } else {
      return Future.value(false);
    }
  }

  void _delete(_TaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId!, shouldDeleteContent: true);
    await _prepare();
    setState(() {});
  }

  Future<bool> _checkPermission() async {
    if (widget.platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks!.addAll(_documents.map((document) =>
        _TaskInfo(name: document['name'], link: document['link'])));

    _items.add(_ItemHolder(name: widget.title));
    for (int i = count; i < _tasks!.length; i++) {
      _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
      count++;
    }

    tasks!.forEach((task) {
      for (_TaskInfo info in _tasks!) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });

    _permissionReady = await _checkPermission();

    if (_permissionReady) {
      await _prepareSaveDir();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _prepareSaveDir() async {
    _localPath =
        (await _findLocalPath())! + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    final directory = widget.platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory?.path;
  }
}

class DownloadItem extends StatelessWidget {
  final _ItemHolder? data;
  final Function(_TaskInfo?)? onItemClick;
  final Function(_TaskInfo)? onActionClick;

  DownloadItem({this.data, this.onItemClick, this.onActionClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: InkWell(
        onTap: data!.task!.status == DownloadTaskStatus.complete
            ? () {
                onItemClick!(data!.task);
              }
            : null,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 64.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      data!.name!,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _buildActionForTask(data!.task!),
                  ),
                ],
              ),
            ),
            data!.task!.status == DownloadTaskStatus.running ||
                    data!.task!.status == DownloadTaskStatus.paused
                ? Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: LinearProgressIndicator(
                      value: data!.task!.progress! / 100,
                    ),
                  )
                : Container()
          ].toList(),
        ),
      ),
    );
  }

  Widget? _buildActionForTask(_TaskInfo task) {
    if (task.status == DownloadTaskStatus.undefined) {
      return RawMaterialButton(
        onPressed: () {
          onActionClick!(task);
        },
        child: Icon(Icons.file_download),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.running) {
      return RawMaterialButton(
        onPressed: () {
          onActionClick!(task);
        },
        child: Icon(
          Icons.pause,
          color: Colors.red,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.paused) {
      return RawMaterialButton(
        onPressed: () {
          onActionClick!(task);
        },
        child: Icon(
          Icons.play_arrow,
          color: Colors.green,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.complete) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 20,
            width: 50,
            color: HexColor("#29335C"),
            child: Center(
              child: Text(
                'View',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              onActionClick!(task);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else if (task.status == DownloadTaskStatus.canceled) {
      return Text('Canceled', style: TextStyle(color: Colors.red));
    } else if (task.status == DownloadTaskStatus.failed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Failed', style: TextStyle(color: Colors.red)),
          RawMaterialButton(
            onPressed: () {
              onActionClick!(task);
            },
            child: Icon(
              Icons.refresh,
              color: Colors.green,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else if (task.status == DownloadTaskStatus.enqueued) {
      return Text('Pending', style: TextStyle(color: Colors.orange));
    } else {
      return null;
    }
  }
}

class _TaskInfo {
  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link});
}

class _ItemHolder {
  final String? name;
  final _TaskInfo? task;

  _ItemHolder({this.name, this.task});
}
