import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final Image _icon;
  // final IconData _icon;

  const HeaderWidget(this._height, this._showIcon, this._icon, {Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          child: Container(
            decoration:  BoxDecoration(
              gradient:  LinearGradient(
                  colors: [
                    Theme.of(context).accentColor.withOpacity(0.4),
                    Theme.of(context).primaryColor.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          clipper:  ShapeClipper(
              [
                Offset(width / 5, widget._height),
                Offset(width / 10 * 5, widget._height - 60),
                Offset(width / 5 * 4, widget._height + 20),
                Offset(width, widget._height - 18)
              ]
          ),
        ),
        ClipPath(
          child: Container(
            decoration:  BoxDecoration(
              gradient:  LinearGradient(
                  colors: [
                    Theme.of(context).accentColor.withOpacity(0.4),
                    Theme.of(context).primaryColor.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          clipper:  ShapeClipper(
              [
                Offset(width / 3, widget._height + 20),
                Offset(width / 10 * 8, widget._height - 60),
                Offset(width / 5 * 4, widget._height - 60),
                Offset(width, widget._height - 20)
              ]
          ),
        ),
        ClipPath(
          child: Container(
            decoration:  BoxDecoration(
              gradient:  LinearGradient(
                  colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).primaryColor,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          clipper:  ShapeClipper(
              [
                Offset(width / 5, widget._height),
                Offset(width / 2, widget._height - 40),
                Offset(width / 5 * 4, widget._height - 80),
                Offset(width, widget._height - 20)
              ]
          ),
        ),
        /*Visibility(
          visible: widget._showIcon,
          child: SizedBox(
            height: widget._height - 10,
            child: Container(
              margin: const EdgeInsets.only(top: 90),
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.transparent,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10),
                ],
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.png',),
                ),

              ),
            ),
          ),
        ),*/
        Visibility(
          visible: widget._showIcon,
          child: SizedBox(

            height: widget._height - 40,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.transparent,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/light-2.png',),
                ),

              ),
              /*child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),*/
            ),
          ),
        ),
        Visibility(
          visible: widget._showIcon,
          child: SizedBox(

            height: widget._height - 80,
            child: Container(
              margin: EdgeInsets.only(left: 75),
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.transparent,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/light-2.png',),
                ),

              ),
              /*child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),*/
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height-20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(_offsets[0].dx, _offsets[0].dy, _offsets[1].dx,_offsets[1].dy);
    path.quadraticBezierTo(_offsets[2].dx, _offsets[2].dy, _offsets[3].dx,_offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}