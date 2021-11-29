import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Sph extends StatelessWidget {
  const Sph({Key? key}) : super(key: key);
  Future<void> _launchInWebViewWithJavaScript(String urls) async {
    if (await canLaunch(urls)) {
      await launch(
        urls,
      );
    } else {
      throw 'Could not launch $urls';
    }
  }

  @override
  Widget build(BuildContext context) {
    int count;
    final pata = [
      Colors.yellow[100],
      Colors.green[100],
      Colors.orange[100],
      Colors.grey[300],
      Colors.teal[200],
      Colors.yellow[100],
    ];
    final des = [
      "මගේ  ආදරණීය දුවේ පුතේ  මම ඔයාලා හැමෝටම  පළමුවෙන්ම technology විෂය තෝරා තෝරාගැනීම පිළිබඳ සුබ පතනවා දිනෙන් දින තාක්ෂණය දියුණු වන ලෝකයේ සුවිශේෂී ඉල්ලුමක්  තාක්ෂණය විෂය ධාරාව තිබේ ඉතින් දුවේ පුතේ මම ඔයාලගේ   තාක්ෂණය විෂය ධාරාව  සාර්ථක කර ගැනීමට  විශ්මිත කරුණු කීපයක්  කියලා දෙන්නයි යන්නේ",
      "පලවෙනිම දේ තමා දුවේ පුතේ  ඔයා කරන ඕනෑම දෙයක්  සාර්ථක කර ගැනීමට  තමා තුළ දැඩි අධිෂ්ඨානයක් සහ කැමැත්තක් තිබිය යුතුය .... ඒ වගේම මනස  නිදහස්ව තිබිය යුතුය  ... ඔයාට පාඩම් කිරීමට  සුදුසු වටපිටාවක් සකසා ගත යුතුය  පොත් මේසය පිළිවෙලකට  මනස අවුල් නොවන සේ තිබිය යුතුය තමාගේ කාලයේ කාලය කළමනාකරණය කර ගැනීම  ඉතා වැදගත් කරුණකි  එනම්  දවසට පැය 5,6..  ඔයා අධ්‍යාපනය වෙනුවෙන්  කලමනාකරණය කර ගත යුතුය",
      "යම් කිසි දෙයක් පාඩම් කිරීමේදී එක   දිගට පාඩම් කිරීමට අපහසු නම්  පැයකට විනාඩි දහයක්  පමණ විවේකයක් ලබා ගන්න ඒ වාගේම  සෑම විෂයක්  පාඩම් කර අවසානයේ .. ඒවායේ කටු සටහනක්  සාදා ගන්න ...එම පාඩම් කරපු අදාල කොටසට අදාල  ප්‍රශ්න  වලට උත්තර සපයන්න  මේය ඉතා වැදගත්ය   පාඩම් කරන දෙ   දීර්ඝ මතකයට ලබාගැනීමට  හැකිතාක් ප්‍රශ්න වලට උත්තර සපයන්න ... මතක තබා ගැනීමට අපහසු කොටස්වලින්  තමා විසින් ප්‍රශ්න තනා  ඒවාට  පිළිතුරු සපයන්න ...   ඔබ පාඩම් කරපු කොටස   සතියකින් පමණ   නැවත  පිළිතුරු සැපයීම සිදු කරන්න..",
      "ආදරණීය දුවේ පුතේ ඔයාලගේ වයසෙදි  අපේ හිත්  එක එක  දේවල් වල පස්සෙ දුවනවා  හැබැයි දුවේ පුතේ  මතක තියාගන්න  ඔයාගේ ජීවිතය සාර්ථක කර ගැනීමට ඇත්තේත් මේ කාලය තුළයි ..ඔයා මේ කාලය තුළ  සාර්ථක  මුහුණ දුන්නොත් ඔයාගෙ ජීවිතේ  හිතන පතන සෑම දෙයකින්ම  ජයග්‍රහණය කර ගැනීමට හැකිය  .... දුවේ පුතේ  ඔයාට  පාඩම් කිරීමට කම්මැලි ගතියක් ,එසේ නැතිනම් ,යම් පෞද්ගලික ප්‍රශ්නයක් ,පාඩම් කරන්න හිතෙන්න නැත්තං  ඔයා youtube එකෙ sinhala motivation නරඹන්න  ...මෙය මගින් හිතට  සුපිරි බලයක් ලැබේ ...මෙය ඔයා සෑම දිනෙකම සිදු කරනවා නම්  ඉතාමත් ඵලදායි වේ",
      "දුවේ පුතේ  විශේෂම දේ වන්නේ  ප්‍රශ්න පත්තර සඳහා  පිළිතුරු ලබා දීමේ කලාවයි ...රචනා ප්‍රශ්න ලිවීමේ දී මෙය ඉතා වැදගත්ය...ප්‍රශ්න පත්‍ර උත්තර සපයා අවසානයේදී .marking scheme  එකත් සමග  ඔබගේ පිළිතුරු සසඳන්න  ...එවිට ප්‍රශ්න පත්තර සඳහා  පිළිතුරු සැපයීමේ  නිවරදි  ක්‍රමය  ඔබට  නිසැකයෙන් ම වැටහෙයි..  මෙහිදී  marking scheme බලා පිළිතුරු සැපයීම සිදු නොකරන්න පිළිතුරු සපයා අවසානයේදී  මෙය සිදු කරන්න",
      "දුවේ පුතේ   මම ලබාදුන් අවවාද සියල්ල එලෙසින්ම පිළිපදින්න .. ඔයාලා හැමෝටම  නිසැකයෙන්ම ජයග්‍රහණය ලැබෙයි .. අපගේ telegram සමූහයට  එකතුවීමට  ඉහළ තිබෙන  බොත්තම  ටච්  කරන්න    ඔයාලගේ තිබෙන ඕනෑම ප්‍රශ්නයක්  අපි සඳහා එවන්න හැකි සෑම අවස්ථාවකම  ඔබ වෙනුවෙන් සහය දැක්වීමට  අපි පොරොන්දු වෙනවා... ඔයාලා සෑම දෙනාගේම  ජීවිත සාර්ථක කරගන්න  මගෙන් සුභ පැතුම්",
    ];

    return SlideInDown(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Bounce(
                child: IconButton(
                  icon: Icon(
                    Icons.group,
                    size: 30,
                  ),
                  onPressed: () {
                    _launchInWebViewWithJavaScript(
                        "https://t.me/joinchat/tzmJ_QtEVQ0yYTNl");
                  },
                ),
              )
            ],
            title: Text(
              "Technology Master",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        count = index + 1;
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            elevation: 100,
                            color: pata[index],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Technology Master",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/guruthuma.PNG"),
                                                fit: BoxFit.fill)),
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: Text(
                                      "($count)",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: Text(
                                    des[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: HexColor("#29335C"),
        ),
      ),
    );
  }
}
