import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "수제버거",
        "imgUrl":
            "https://i.ibb.co/HBGKYn4/foodiesfeed-com-summer-juicy-beef-burger.jpg",
      },
      {
        "category": "건강식",
        "imgUrl":
            "https://i.ibb.co/mB5YNs2/foodiesfeed-com-pumpkin-soup-with-pumpkin-seeds-on-top.jpg",
      },
      {
        "category": "한식",
        "imgUrl":
            "https://i.ibb.co/Kzzpc97/Beautiful-vibrant-shot-of-traiditonal-Korean-meals.jpg",
      },
      {
        "category": "디저트",
        "imgUrl":
            "https://i.ibb.co/DL5vJVZ/foodiesfeed-com-carefully-putting-a-blackberry-on-tiramisu.jpg",
      },
      {
        "category": "피자",
        "imgUrl": "https://i.ibb.co/qsm8QH4/pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl":
            "https://i.ibb.co/yQDkq2X/foodiesfeed-com-hot-shakshuka-in-a-cast-iron-pan.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      //Drawer==================================================================================================================================================================
      drawer: Drawer(
        child: Column(
          children: [
            // DrawerHeader=======================================================================================================================================
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: SizedBox(
                width: double.infinity, // 가득 채우기
                child: Column(
                  children: [
                    /// 동그란 배경
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),

                        /// 이미지
                        child: Image.network(
                          "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                          width: 62,
                        ),
                      ),
                    ),

                    /// 닉네임 상단 여백
                    SizedBox(height: 13),

                    /// 닉네임
                    Text(
                      "닉네임",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /// 이메일
                    Text(
                      "hello@world.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // DrawerHeader=======================================================================================================================================

            //Event Banner=======================================================================================================================================

            // 특정 비율로 위젯을 보여주기
            AspectRatio(
              aspectRatio: 12 / 4, // 가로 : 세로 = 12 : 4 (이미지를 12:4로 준비했어요)
              /// 이벤트 배너 리스트
              /// 스크롤을 하는데, 특정 항목이 스냅이 걸리도록 만들고 싶은 경우 PageView를 사용해요.
              child: PageView(
                children: [
                  Image.network(
                    "https://i.ibb.co/Q97cmkg/sale-event-banner1.jpg",
                  ),
                  Image.network(
                    "https://i.ibb.co/GV78j68/sale-event-banner2.jpg",
                  ),
                  Image.network(
                    "https://i.ibb.co/R3P3RHw/sale-event-banner3.jpg",
                  ),
                  Image.network(
                    "https://i.ibb.co/LRb1VYs/sale-event-banner4.jpg",
                  ),
                ],
              ),
            ),
            //Event Banner=======================================================================================================================================

            //MENU=======================================================================================================================================

            /// 구매 내역
            ListTile(
              title: Text(
                '구매내역',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                // 클릭시 drawer 닫기
                Navigator.pop(context);
              },
            ),

            /// 레시피 공유하기
            ListTile(
              title: Text(
                '저장한 레시피',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                // 클릭시 drawer 닫기
                Navigator.pop(context);
              },
            ),
            //MENU=======================================================================================================================================
          ],
        ),
      ),
      //Drawer==================================================================================================================================================================

      //appBar==================================================================================================================================================================
      appBar: AppBar(
        elevation: 0, // 그림자 없애기
        backgroundColor: Colors.white, // 배경 색상
        centerTitle: false, // title 중앙 정렬
        iconTheme: IconThemeData(color: Colors.black), // app bar icon color
        title: Text(
          "Park woo's Food Recipe ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          /// My Button
          IconButton(
            onPressed: () {
              print("go my page");
            },
            icon: Icon(
              Icons.person_outline,
            ),
          ),
        ],
      ),
      //appBar==================================================================================================================================================================

      //Body==================================================================================================================================================================
      body: Container(
        child: Column(
          children: [
            //Search Bar====================================================================================
            Container(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "상품을 검색해주세요.",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                margin: EdgeInsets.all(8)),

            //Categories====================================================================================
            Expanded(
                child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  child: Container(
                    child: Stack(children: [
                      Image.network(
                        dataList[index]["imgUrl"],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Text(
                          dataList[index]["category"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ]),
                    height: 100,
                  ),
                );
              },
            ))
          ],
        ),
      ),
      //Body==================================================================================================================================================================
    );
  }
}
