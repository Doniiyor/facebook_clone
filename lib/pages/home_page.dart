import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool changeTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (changeTheme) ? Colors.grey.shade800: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: (changeTheme) ? Colors.black : Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: (){
            setState(() {
              changeTheme = !changeTheme;
            });
          },
          child: Text(
            "facebook",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: (changeTheme)? Colors.grey.shade300 :Colors.black.withOpacity(0.6),
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: (changeTheme)? Colors.grey.shade300 :Colors.black.withOpacity(0.6),
                size: 30,
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Top section || User profile picture
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              color: (changeTheme)?Colors.black :Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        AssetImage("assets/images/user_2.jpeg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1),
                              borderRadius: BorderRadius.circular(40)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                                hintText: "What's on your mind?",
                                hintStyle:
                                TextStyle(color: Colors.grey.shade500),
                                border: InputBorder.none),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.video_call,
                                  color: Colors.red,
                                ),
                                Text(" Live",style: TextStyle(color: (changeTheme)?Colors.grey.shade200:Colors.black),)
                              ],
                            ),
                          ),
                          VerticalDivider(
                            indent: 5,
                            endIndent: 5,
                            width: 0,
                            color: Colors.grey.shade300,
                            thickness: 1.5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.photo,
                                  color: Colors.green,
                                ),
                                Text(" Photo",style: TextStyle(color: (changeTheme)?Colors.grey.shade200:Colors.black),)
                              ],
                            ),
                          ),
                          VerticalDivider(
                            indent: 5,
                            endIndent: 5,
                            width: 0,
                            color: Colors.grey.shade300,
                            thickness: 1.5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                Text(" Check in",style: TextStyle(color: (changeTheme)?Colors.grey.shade200:Colors.black),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /// Story List
            Container(
              height: MediaQuery.of(context).size.height * 0.26,
              color: (changeTheme)? Colors.black :Colors.white,
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                      crossAxisCount: 1),
                  itemBuilder: (ctx, index) {
                    return stories(index);

                  }),
            ),
            SizedBox(height: 10,),

            ///  Post List
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    mainAxisExtent: MediaQuery.of(context).size.height*0.6,
                    childAspectRatio: 1,
                    crossAxisCount: 1),
                itemBuilder: (ctx, index) {
                  return postList(index);

                }),
          ],
        ),
      ),
    );
  }

  ///  Post List
  Container postList(int index) {
    return Container(
      color: (changeTheme) ? Colors.black:Colors.white,
      child: GridTile(
        header: Container(
          color: (changeTheme) ? Colors.black:Colors.white,
          height: 120,
          padding: EdgeInsets.only(left: 5,),
          child: Column(
            children: [
              GridTileBar(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/user_${(index)%5}.jpeg")
                      )
                  ),
                ),
                title: Text("User ${index+1}",style: TextStyle(color: (changeTheme)? Colors.grey.shade300 :Colors.black, fontSize: 20,letterSpacing: 0.5,fontWeight: FontWeight.w700),),
                subtitle: Text("${index+1} hr ago",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w400,letterSpacing: -0.4,fontSize: 15,),),
                trailing: Icon(Icons.more_horiz,color: (changeTheme)? Colors.grey.shade300 :Colors.black.withOpacity(0.6),),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel nibh vitae tortor tincidunt rhoncus.",style: TextStyle(color:(changeTheme) ?  Colors.grey.shade500 :Colors.grey.shade700,fontWeight: FontWeight.w400,letterSpacing: 0.5,fontSize: 14),),

                  )

              )
            ],
          ),
        ),
        child: Container(
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/story_${(index+2)%4}.jpeg")
          ),
        ),
        footer: Container(
          height: 80,
          color: (changeTheme)? Colors.black :Colors.white,
          child: Column(
            children: [
              GridTileBar(
                title: Row(

                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white,),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(Icons.thumb_up,size: 15,),
                    ),
                    Transform.translate(
                      offset: Offset(-5,0),

                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white,),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.favorite_outlined,size: 15,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("${((index+1) *1240)~/100}K",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500),),
                  ],

                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text("${(index+1)*525} Comments",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w500),),
                ),
              ),
              Expanded(child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.grey.shade500,
                        ),
                        Text(" Like",style: TextStyle(color: Colors.grey.shade500,letterSpacing: 0.5,fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey.shade500,
                        ),
                        Text(" Comment",style: TextStyle(color: Colors.grey.shade500,letterSpacing: 0.5,fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.ios_share_outlined,
                          color: Colors.grey.shade500,
                        ),
                        Text(" Share",style: TextStyle(color: Colors.grey.shade500,letterSpacing: 0.5,fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }


  /// Story Function
  GridTile stories(int index) {
    return GridTile(
      header: Padding(
        padding:  EdgeInsets.only(top: 10,left: 5),
        child: GridTileBar(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/user_${index%5}.jpeg")
                )
            ),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/story_${index%4}.jpeg")
          ),
        ),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.2),
                ]
            ),
          ),
        ),
      ),
      footer: GridTileBar(
        title: Text("User $index",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
