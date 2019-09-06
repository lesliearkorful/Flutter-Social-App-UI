import 'package:flutter/material.dart';
import '../../global-widgets/pill.dart';
import '../../data/user.dart';
import '../../data/global.dart';


class Panels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: <Widget>[

          Panel(
            name: 'photos',
            count: User.photosCount,
            color: UIColors.yellowOrange,
            selected: true,
          ),

          SizedBox( width: 10 ),

          Panel(
            name: 'articles',
            count: User.articlesCount,
            color: UIColors.softRed,
          ),

          SizedBox( width: 10 ),

          Panel(
            name: 'followers',
            count: User.followersCount,
            color: UIColors.softPurple,
          ),
          
        ],
      )
    );
  }
}



class Panel extends StatefulWidget {
  final Color color;
  final bool selected;
  final count;
  final String name;
  
  Panel({
    this.selected = false,
    @required this.name,
    @required this.count,
    this.color,
  });

  @override
  _PanelState createState() => _PanelState(selected);
}

class _PanelState extends State<Panel> {
  bool selected;
  _PanelState(this.selected);
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selected = !selected),
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selected
                    ? widget.color
                    : Colors.black.withOpacity(0.04),
            boxShadow: [
              selected
              ? BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 4,
                color: widget.color.withOpacity(0.2)
              )
              : BoxShadow(
                color: Colors.transparent
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('${widget.count}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: selected
                          ? Colors.white
                          : widget.color 
                ),
              ),

              SizedBox( height: 20 ),


              Text('${widget.name}',
                style: TextStyle(
                  fontSize: 15,
                  color: selected
                          ? Colors.white
                          : UIColors.navyBlue
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}



class Categories extends StatelessWidget {
  final Color color = UIColors.yellowOrange;

  final List<String> postCategories = [
    'Featured',
    'Popular',
    'Following',
    'Recent'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.symmetric(vertical: 30),
      width: double.maxFinite,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: (horizontalPadding - 10),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: postCategories.length,
        itemBuilder: (context, index) {
          return Pill(
            text: postCategories[index].toUpperCase(),
            color: color,
            selected: (index == 0) ? true : false,
          );
        },
      )
    );
  }
}


enum MediaType {
  photo,
  video,
}


class MediaList extends StatelessWidget {
  final MediaType type;
  MediaList({ this.type });
  
  @override
  Widget build(BuildContext context) {
    final bool isVideo = (type == MediaType.video);
    final List<String> source = isVideo ? User.videos : User.photos;
    final String name = isVideo ? 'My videos' : 'My photos';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text('$name',
            style: TextStyle(
              color: UIColors.navyBlue,
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
          ),
        ),


        Container(
          margin: EdgeInsets.only(bottom: 30),
          height: 160,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: (horizontalPadding - 5), vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: isVideo ? source.length : (source.length + 1),
            itemBuilder: (context, index) {

              final isFirstImage = (!isVideo && (index == 0));
              String image = isVideo
                              ? source[index]
                              : isFirstImage
                                ? source[index]
                                : source[index - 1];
              return Container(
                alignment: isVideo ? Alignment.bottomLeft : Alignment.center,
                padding: EdgeInsets.all(10),
                width: isVideo ? 284.44 : 140,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(12),
                    image: isFirstImage
                      ? null
                      : DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    boxShadow: [
                      isFirstImage
                      ? BoxShadow(
                        color: Colors.transparent
                      )
                      : BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1)
                      )
                    ]
                  ),
                  child: isVideo
                  ? Container(
                    child: Icon(Icons.play_arrow, color: UIColors.navyBlue ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                  )
                  : isFirstImage

                  ? Icon(Icons.add, size: 80, color: Colors.black.withOpacity(0.1), )
                  : Container(),
              );
            },
          ),
        ),
      ],
    );
  }
}