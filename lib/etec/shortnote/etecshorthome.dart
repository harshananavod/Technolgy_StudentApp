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

class Etecshorthome extends StatefulWidget with WidgetsBindingObserver {
  final TargetPlatform? platform;

  Etecshorthome({Key? key, this.title, this.platform}) : super(key: key);

  final String? title;

  @override
  _EtecshorthomeState createState() => new _EtecshorthomeState();
}

class _EtecshorthomeState extends State<Etecshorthome> {
  final _documents = [
    {
      //automobile
      'name': ' ජ්වලන පද්ධතිය ',
      'link':
          'https://drive.google.com/uc?export=download&id=1RQZd-M_4TUXQppvDpT00iE-vf_jqcEJB'
    },
    {
      'name': 'දෙපහර එන්ජිම',
      'link':
          'https://drive.google.com/uc?export=download&id=13-3n143iFonnF-vV0Xb21NkvgYyI7CRG'
    },
    {
      //automobile
      'name': 'ස්නේහන පද්ධතිය ',
      'link':
          'https://drive.google.com/uc?export=download&id=1PW3CFP5gKFShKyu0Bj6cMVA6kTnwEro3'
    },
    {
      'name': 'තිරිංග පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1zLH_cT5tH3JSVBNt0SIPYRDAD95Yd4c0'
    },
    {
      //automobile
      'name': ' අවරපෙති කඳ දසත මූට්ටුව',
      'link':
          'https://drive.google.com/uc?export=download&id=1dgOAOIohGsIh2IP4Jz9BOn4aJ30MOg7R'
    },
    {
      'name': 'අවලම්භන පද්ධතියේ අවශ්‍යතාවය',
      'link':
          'https://drive.google.com/uc?export=download&id=1IttmECAV-AgyZ9KDOmheBtwhdI7sYKqn'
    },
    {
      //automobile
      'name': 'ඉලෙක්ට්‍රොනික ඉන්ධන විදිනය ',
      'link':
          'https://drive.google.com/uc?export=download&id=1Ok5Jrw3UW6LDr9CSRHPiU5L8AHihJjFk'
    },
    {
      'name': 'එන්ජින් වර්ගීකරණය',
      'link':
          'https://drive.google.com/uc?export=download&id=1te7AM1GtnVl7G3UNcS_ovj_FuWeMyrR7'
    },
    {
      //automobile
      'name': 'එන්ජින් සහ මිනුම් ',
      'link':
          'https://drive.google.com/uc?export=download&id=17BEWxYjelwrRTHdu6xwwZgRpHnhh88XM'
    },
    {
      'name': 'කල්ච් පද්ධතියකින් ඉටුවන කාර්යය',
      'link':
          'https://drive.google.com/uc?export=download&id=1oHZ-QLbJvYAZKLM2Yy7AlZ87-YBYYHbH'
    },
    {
      //automobile
      'name': 'ඩීසල් ඉන්ධන පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1VRrYFIHTCYpCIKcYketeBaoXWRGTv_-K'
    },
    {
      'name': 'තිරිංග පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1PzI3DBYOnKUa8P2EBXvz7zOijIbaHJJ0'
    },
    {
      'name': 'තිරිංග පද්ධතිය 2',
      'link':
          'https://drive.google.com/uc?export=download&id=1gxK3qTilz_w9tzE6rWJToY8A2DbvTywm'
    },
    {
      //automobile
      'name': 'පෙට්‍රල් වාහනයක ඉන්ධන පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1dL6oUIeNnkAoITEL2xA2vDndZVmn0pdX'
    },
    {
      'name': 'මෝටර් රථයක ප්‍රධාන පද්ධති ',
      'link':
          'https://drive.google.com/uc?export=download&id=1Sgslo9Jh_tq5jEkW-4Unqo5RfvaHu7Ba'
    },
    {
      //automobile
      'name': 'සම්ප්‍රේෂණ පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1KCgT4XvEsRun4XiO34f3i4rKiuy4DMCK'
    },
    {
      'name': 'සිව් පහර ඩීසල් එන්ජිම',
      'link':
          'https://drive.google.com/uc?export=download&id=1URJRqitghKBpBfjtytJKWIwH7RRRcEfx'
    },
    {
      //automobile
      'name': 'සිව් පහර පෙට්‍රල් එන්ජිම',
      'link':
          'https://drive.google.com/uc?export=download&id=1vhwpg0ZuFNqSEHd4Cgxphif3ran3gHUM'
    },
    {
      'name': 'සිසිලන පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1T1ibBDqGZeUY_CuPjxXB4-RSpqGAuxzf'
    },
    {
      //automobile
      'name': 'සුක්කානම් පද්ධතිය',
      'link':
          'https://drive.google.com/uc?export=download&id=1qwUhntcnrKsxCtGgKGpHUGtyFMSC3au8'
    },
  ];

  final _images = [
    //physics
    {
      //chem
      'name': 'lesson 01 introduction ',
      'link':
          'https://drive.google.com/uc?export=download&id=1Ls_g_1OASFZMg84CVR8XZKlI5GXjvd4R'
    },
    {
      'name': 'building construction ',
      'link':
          'https://drive.google.com/uc?export=download&id=1-5rE7_xTMu_eGZaO_Sf9pOwJ0tholm2h'
    },
    {
      //chem
      'name': ' මූලික ඉලෙක්ට්‍රොනික තාක්ෂණවේදය',
      'link':
          'https://drive.google.com/uc?export=download&id=1hDPdxpqe93JjQduE1uVDfDfwbLxxIaxt'
    },
    {
      'name': 'බිම් මැනුම ',
      'link':
          'https://drive.google.com/uc?export=download&id=1rCeVJDptXqAVLo05MI20M45zLcNY3-vv'
    },
    {
      'name': 'ගෘහස්ථ ජල සම්පාදනය  සහ කසල අපවහනය 1 ',
      'link':
          'https://drive.google.com/uc?export=download&id=1IiRxViPhRVXbWMF3Ha87MnfqFnTdF1hT'
    },
    {
      //chem
      'name': 'ගෘහස්ථ ජල සම්පාදනය  සහ කසල අපවහනය 2',
      'link':
          'https://drive.google.com/uc?export=download&id=1qlgpyGx_rrVfiRiHlwUycRWIQwyOo9nw'
    },

    {
      //chem
      'name': 'ඉංජිනේරු ඇඳීම ',
      'link':
          'https://drive.google.com/uc?export=download&id=1L8zxURiGyciuKE_fg_oS7Lsm_UCqZOfg'
    },
    {
      'name': ' නිෂ්පාදන තාක්ෂණවේදය',
      'link':
          'https://drive.google.com/uc?export=download&id=1QxGz4BGc_qoPNpaKKITCKtWujq2o8-LW'
    },
    {
      //chem
      'name': 'විදුලි බල උත්පාදනය හා සම්ප්‍රේෂණය ',
      'link':
          'https://drive.google.com/file/d/16shVZFbpvSZ8cA_nf71D--nH2PbnlE98/view?usp=sharing'
    },
    {
      'name': ' විදුලි බල උත්පාදනය හා සම්ප්‍රේෂණය 2',
      'link':
          'https://drive.google.com/uc?export=download&id=1uHoaOTyrRI38ZqnU8RZrWG03WpGmco0u'
    },
    {
      //chem
      'name': 'ව්‍යසායකත්වය හා කළමනාකරණය ',
      'link':
          'https://drive.google.com/uc?export=download&id=154FAnYzHR0pFUw1nyaRXUNYLw6aeTS7e'
    },
    {
      'name': ' Safety',
      'link':
          'https://drive.google.com/uc?export=download&id=1Z8Y1o4rs3SfA_9t4qR1DEXYM6TNyE2y8'
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
        backgroundColor: Colors.yellow[50],
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
                      image: AssetImage("images/short.PNG"), fit: BoxFit.fill),
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
    // ignore: unused_local_variable
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks!.addAll(_documents.map((document) =>
        _TaskInfo(name: document['name'], link: document['link'])));

    _items.add(_ItemHolder(name: 'Auto Mobile'));
    for (int i = count; i < _tasks!.length; i++) {
      _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
      count++;
    }

    _tasks!.addAll(_images
        .map((image) => _TaskInfo(name: image['name'], link: image['link'])));

    _items.add(_ItemHolder(name: 'Other Lesons'));
    for (int i = count; i < _tasks!.length; i++) {
      _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
      count++;
    }

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
