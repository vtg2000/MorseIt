import 'package:flutter/material.dart';
import 'package:torch/torch.dart';
import 'package:vibration/vibration.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async'; 
import 'package:assets_audio_player/assets_audio_player.dart';

// import 'package:notifications/notifications.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[100],
      ),
      home: MyHomePage(title: 'Morse It!'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Notifications notifications = new Notifications();
// StreamSubscription<NotificationEvent> events = notifications.stream.listen(onData);

// void onData(NotificationEvent event) => print(event.toString());

class _MyHomePageState extends State<MyHomePage> {
  var mytext = '';
  var vibr = [];
  var tor = [];
  var audioList = [];
  var morse = '';
  // AudioPlayer audioPlayer = AudioPlayer();
  final assetsAudioPlayer = AssetsAudioPlayer();

  playLocal(d){
    if (d=='dot'){
      audioList.add('dot.wav');
    }
    else if(d=='dash')
    {
      audioList.add('dash.wav');
    }
    else if(d=='silence')
    {
      audioList.add('silence.mp3');
    }
  }

  void dot()
  {
    vibr.add(200);
    vibr.add(200);
    tor.add(200);
    setState(() {
      morse += '.';
    });
    playLocal('dot');
  }

  void dash()
  {
    vibr.add(200);
    vibr.add(600);
    tor.add(600);
    setState(() {
      morse += '-';
    });
    playLocal('dash');
  }

  void space()
  {
    vibr.add(600);
    vibr.add(0);
    setState(() {
      morse += ' ';
    });
    playLocal('silence');
  }

  void makemorse()
  {
    morse = '';
    for (int i = 0; i < mytext.length; i++){
      switch (mytext[i]){
        case 'a':{
          dot();
          dash();
          space();
          break;
        }
        case 'b':{
          dash();
          dot();
          dot();
          dot();
          space();
          break;
        }
        case 'c':{
          dash();
          dot();
          dash();
          dot();
          space();
          break;
        }
        case 'd':{
          dash();
          dot();
          dot();
          space();
          break;
        }
        case 'e':{
          dot();
          space();
          break;
        }
        case 'f':{
          dot();
          dot();
          dash();
          dot();
          space();
          break;
        }
        case 'g':{
          dash();
          dash();
          dot();
          space();
          break;
        }
        case 'h':{
          dot();
          dot();
          dot();
          dot();
          space();
          break;
        }
        case 'i':{
          dot();
          dot();
          space();
          break;
        }
        case 'j':{
          dot();
          dash();
          dash();
          dash();
          space();
          break;
        }
        case 'k':{
          dash();
          dot();
          dash();
          space();
          break;
        }
        case 'l':{
          dot();
          dash();
          dot();
          dot();
          space();
          break;
        }
        case 'm':{
          dash();
          dash();
          space();
          break;
        }
        case 'n':{
          dash();
          dot();
          space();
          break;
        }
        case 'o':{
          dash();
          dash();
          dash();
          space();
          break;
        }
        case 'p':{
          dot();
          dash();
          dash();
          dot();
          space();
          break;
        }
        case 'q':{
          dash();
          dash();
          dot();
          dash();
          space();
          break;
        }
        case 'r':{
          dot();
          dash();
          dot();
          space();
          break;
        }
        case 's':{
          dot();
          dot();
          dot();
          space();
          break;
        }
        case 't':{
          dash();
          space();
          break;
        }
        case 'u':{
          dot();
          dot();
          dash();
          space();
          break;
        }
        case 'v':{
          dot();
          dot();
          dot();
          dash();
          space();
          break;
        }
        case 'w':{
          dot();
          dash();
          dash();
          space();
          break;
        }
        case 'x':{
          dash();
          dot();
          dot();
          dash();
          space();
          break;
        }
        case 'y':{
          dash();
          dot();
          dash();
          dash();
          space();
          break;
        }
        case 'z':{
          dash();
          dash();
          dot();
          dot();
          space();
          break;
        }
        case ' ':{
          space();
          space();
          setState(() {
            morse += '|  ';
          });
          break;
        }
        case '1':{
          dot();
          dash();
          dash();
          dash();
          dash();
          space();
          break;
        }
        case '2':{
          dot();
          dot();
          dash();
          dash();
          dash();
          space();
          break;
        }
        case '3':{
          dot();
          dot();
          dot();
          dash();
          dash();
          space();
          break;
        }
        case '4':{
          dot();
          dot();
          dot();
          dot();
          dash();
          space();
          break;
        }
        case '5':{
          dot();
          dot();
          dot();
          dot();
          dot();
          space();
          break;
        }
        case '6':{
          dash();
          dot();
          dot();
          dot();
          dot();
          space();
          break;
        }
        case '7':{
          dash();
          dash();
          dot();
          dot();
          dot();
          space();
          break;
        }
        case '8':{
          dash();
          dash();
          dash();
          dot();
          dot();
          space();
          break;
        }
        case '9':{
          dash();
          dash();
          dash();
          dash();
          dot();
          space();
          break;
        }
        case '0':{
          dash();
          dash();
          dash();
          dash();
          dash();
          space();
          break;
        }

      } 
    }
  }

  void vibrate() {
    vibr = [];
    makemorse();
    vibr = vibr.cast<int>();
    Vibration.vibrate(pattern: vibr, amplitude: 255);
  }

  void torch()
  {
    tor = [];
    makemorse();
    int i = 0;
    new Timer.periodic(Duration(milliseconds: 800), (Timer t)=>
    {
      lightup(tor, t, i),
      i++,
    });
  }


  void lightup(tor, t, i)
  {
    if(i<tor.length)
    {
      Torch.flash(Duration(milliseconds: tor[i]));
    }
    else{
      t.cancel();
    }
  }

  void sound()
  {
      audioList = [];
      makemorse();
      audioList = audioList.cast<String>();
      assetsAudioPlayer.openPlaylist(
      Playlist(
        assetAudioPaths: audioList
      )
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Image(image: AssetImage('morse.png'),
            height: 300,
            ),
            )
            ,
            Padding(
              padding: EdgeInsets.fromLTRB(60,20,60,20),
              child: TextField(
              
                // obscureText: true,
              decoration: InputDecoration(
                
                border: OutlineInputBorder(),
                labelText: 'Enter your text',
                
              ),
              onChanged: (text)
              {
                setState(() {
                  mytext = text;
                }); 
              },
            ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
              morse,
              style: TextStyle(fontSize: 20),
            ),
            )
            ,
            
            Row(children: <Widget>[
              Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
              child: RaisedButton(
                color: Colors.purple[400],
                textColor: Colors.purple[50],
                shape: StadiumBorder(),
              child: Text(
                'Vibrate'
              ),
              onPressed: vibrate,
              ) ,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10,0),
                child: RaisedButton(
                color: Colors.purple[400],
                textColor: Colors.purple[50],
                shape: StadiumBorder(),
              child: Text(
                'Torch'
              ),
              onPressed: torch,
            ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10,0),
                child: RaisedButton(
                color: Colors.purple[400],
                shape: StadiumBorder(),
                textColor: Colors.purple[50],
              child: Text(
                'Sound'
              ),
              onPressed: sound,
            ),
              ),
            ],)
            
            ,
            
          ],
        ),
      ),
    );
  }
}
