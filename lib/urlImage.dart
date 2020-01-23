import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UrlImage extends StatefulWidget {
    @override 
    State<StatefulWidget> createState() {
        return new UrlImageState();
    }
}

class UrlImageState extends State<UrlImage> {
    var imageUrls = [
        'https://img.freepik.com/free-vector/abstract-particles-background-with-light-effect_1017-20135.jpg?size=626&ext=jpg',
        'https://nuwallpaperhd.info/wp-content/uploads/2018/01/Flowers-Yellow-Background-Wallpaper.jpg',
        'https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'http://www.hdwallpaperspulse.com/wp-content/uploads/2017/12/23/awesome-natural-view-image.jpg',
        'https://www.setaswall.com/wp-content/uploads/2017/07/Bench-Background-15-2560x1920.jpg'
    ];

    var selectedImageIndex = 0;

    @override 
    Widget build(BuildContext buildContext) {
        final cachedImage = new CachedNetworkImage(
            placeholder: (context, url) => new CircularProgressIndicator(),
            imageUrl: this.imageUrls[selectedImageIndex],
            height: 250.0,
            fit: BoxFit.cover,
        );

        return new Scaffold(
            appBar: new AppBar(
                title: new Text('UrlImage'),
            ),
            body: new Container(
                child: new Column(
                    children: <Widget>[
                        new Stack(
                            children: <Widget>[
                                new Center(
                                    child: cachedImage,
                                )
                            ],
                        ),
                        new Row(
                            children: <Widget>[
                                new Expanded(
                                    child: new RaisedButton(
                                        onPressed: () {
                                            setState(() {
                                                this.selectedImageIndex = this.selectedImageIndex <= 0 ? (this.imageUrls.length - 1) : this.selectedImageIndex - 1;
                                            });
                                        },
                                        child: new Text('Back'),
                                    ),
                                ),
                                new Expanded(
                                    child: new RaisedButton(
                                        onPressed: () {
                                            setState(() {
                                                this.selectedImageIndex = this.selectedImageIndex >= (this.imageUrls.length - 1) ? 0 :  this.selectedImageIndex + 1;
                                            });
                                        },
                                        child: new Text('Next'),
                                    ),
                                )
                            ],
                        )
                    ],
                ),
            )
        );
    }
}