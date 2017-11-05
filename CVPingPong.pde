/**
 * HSVColorTracking
 * Greg Borenstein
 * https://github.com/atduskgreg/opencv-processing-book/blob/master/code/hsv_color_tracking/HSVColorTracking/HSVColorTracking.pde
 *
 * Modified by Jordi Tost @jorditost (color selection)
 *
 * University of Applied Sciences Potsdam, 2014
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

final int MAX_PLAYERS = 2;

Capture video;
ArrayList<OpenCV> opencv;
PImage src, colorFilteredImage;
ArrayList<ArrayList<Contour>> contours;
ArrayList<HueRange> hues;
ArrayList<Player> players;
ArrayList<PlayerProcessor> playerProcessors;

int playerCount = 0;
boolean playerOne = false;
boolean playerTwo = false;
boolean createPlayer = false;
PImage correctedFrame;

void setup() {
  video = new Capture(this, 320, 240);
  video.start();

  playerProcessors = new ArrayList<PlayerProcessor>();
  players = new ArrayList<Player>();
  opencv = new ArrayList<OpenCV>();
  hues = new ArrayList<HueRange>();
  contours = new ArrayList<ArrayList<Contour>>();

  size(1280, 480, P2D);
}

void draw() {
  if (video.available()) {
    video.read();
  }  
  
  correctedFrame = getReversePImage(video.get());
  drawCamImage(correctedFrame);
  
  if (createPlayer && playerCount <= MAX_PLAYERS) {
    generatePlayer();
  }
  
  for (int i =0; i < players.size(); i++) {
    playerProcessors.get(i).updatePlayer(correctedFrame, players.get(i));
    players.get(i).drawPlayer();
  }
  
}

void generatePlayer() {
    color c = get(mouseX, mouseY);
    int hue = int(map(hue(c), 0, 255, 0, 180));
    println("hue to detect: " + hue);
    println("r: " + red(c) + " g: " + green(c) + " b: " + blue(c));
    
    hues.add(new HueRange(hue-10, hue+10));
    opencv.add(new OpenCV(this, video.width, video.height));
    contours.add(new ArrayList<Contour>());
    playerProcessors.add(new PlayerProcessor(new OpenCV(this, video.width, video.height), new HueRange(hue-10, hue+10)));
   
    createPlayer = false;
    if (playerOne == false) playerOne=true;
    else playerTwo = true;    
    players.add(new Player(new Rectangle(), get(mouseX, mouseY), playerCount));
}



void drawCamImage(PImage image) {
  image.resize(image.width*2, image.height*2);
  image(image, 0, 0);
  image.resize(image.width/2, image.height/2);
}  

public PImage getReversePImage( PImage image ) {
  PImage reverse = new PImage( image.width, image.height );
  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      reverse.set( image.width - 1 - i, j, image.get(i, j) );
    }
  }
  return reverse;
}

void mouseReleased() {
  if (playerCount < MAX_PLAYERS) {
    createPlayer = true;
    playerCount++;
    println("PlayerCount: " + playerCount);
  }
}