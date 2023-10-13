import com.pdplusplus.*;
import com.portaudio.*;

Circle[] notes = new Circle[12];
Pd pd;
MyMusic music;
int[] scales = new int[12];
int points = 0;
int lives = 5;
int scale = (int) random(0,11);
int level = 1;

void setup() {
  size(700,700);
  startLevel();
  music = new MyMusic();
  pd  = Pd.getInstance(music);
  pd.start();
}

void draw() {
  background(64);
  drawCircles();
  
  for (int i = 0; i < 12; i++) {
    if (notes[i] != null) {
      notes[i].move();
    }
  }
  
  playSound();
  
  if (level <= 3 && lives > 0) {
    displayPoints();
    displayKey();
    displayLevel();
    displayLives();
  }
  
  gameStatus();
}

void addPoint() {
  points++;
}

void subtractPoint() {
  points--;
  lives--;
}

void gameStatus() {
  if (lives <= 0) {
    //loser
    for (int i = 0; i < notes.length; i++) {
      notes[i] = null;
    }
    //display lose text
    textSize(100);
    fill(250, 0, 0);
    text("You Lose", 180, 350);
  }
  if (level == 4 && lives > 0) {
    //winner
    for (int i = 0; i < notes.length; i++) {
      notes[i] = null;
    }
    //display win text
    textSize(100);
    fill(0, 250, 0);
    text("You Win", 180, 350);
  }
}

void playSound() {
  if (notes[0] != null && notes[0].isCollision()) {
    music.setFreq((float)pd.mtof(notes[0].midiNum));
    music.triggerAttack();
  } else if (notes[1] != null && notes[1].isCollision()) {
    music.setFreq((float)pd.mtof(notes[1].midiNum));
    music.triggerAttack();
  } else if (notes[2] != null && notes[2].isCollision()) {
    music.setFreq((float)pd.mtof(notes[2].midiNum));
    music.triggerAttack();
  } else if (notes[3] != null && notes[3].isCollision()) {
    music.setFreq((float)pd.mtof(notes[3].midiNum));
    music.triggerAttack();
  } else if (notes[4] != null && notes[4].isCollision()) {
    music.setFreq((float)pd.mtof(notes[4].midiNum));
    music.triggerAttack();
  } else if (notes[5] != null && notes[5].isCollision()) {
    music.setFreq((float)pd.mtof(notes[5].midiNum));
    music.triggerAttack();
  } else if (notes[6] != null && notes[6].isCollision()) {
    music.setFreq((float)pd.mtof(notes[6].midiNum));
    music.triggerAttack();
  } else if (notes[7] != null && notes[7].isCollision()) {
    music.setFreq((float)pd.mtof(notes[7].midiNum));
    music.triggerAttack();
  } else if (notes[8] != null && notes[8].isCollision()) {
    music.setFreq((float)pd.mtof(notes[8].midiNum));
    music.triggerAttack();
  } else if (notes[9] != null && notes[9].isCollision()) {
    music.setFreq((float)pd.mtof(notes[9].midiNum));
    music.triggerAttack();
  } else if (notes[10] != null && notes[10].isCollision()) {
    music.setFreq((float)pd.mtof(notes[10].midiNum));
    music.triggerAttack();
  } else if (notes[11] != null && notes[11].isCollision()) {
    music.setFreq((float)pd.mtof(notes[11].midiNum));
    music.triggerAttack();
  } else {
    music.triggerRelease();
  }
}

void assignNotes() {
  int cScale = 60;
  int cSharpScale = 61;
  int dScale = 62;
  int dSharpScale = 63;
  int eScale = 64;
  int fScale = 65;
  int fSharpScale = 66;
  int gScale = 67;
  int gSharpScale = 68;
  int aScale = 69;
  int aSharpScale = 70;
  int bScale = 71;
  scales[0] = cScale;
  scales[1] = cSharpScale;
  scales[2] = dScale;
  scales[3] = dSharpScale;
  scales[4] = eScale;
  scales[5] = fScale;
  scales[6] = fSharpScale;
  scales[7] = gScale;
  scales[8] = gSharpScale;
  scales[9] = aScale;
  scales[10] = aSharpScale;
  scales[11] = bScale;
}

void startLevel() {
  assignNotes();
  int[] steps = {0, 2, 4, 5, 7, 9, 11};
  for (int i = 0; i < 7; i++) {
    notes[i] = new Circle(steps[i] + scales[scale], random(50, 650), random(50, 650));
  }
  int[] leftover = {1, 3, 6, 8, 10};
  for (int i = 0; i < 5; i++) {
    notes[i + 7] = new Circle(leftover[i] + scales[scale], random(50, 650), random(50, 650));
  }
}

void drawCircles() {
  for (int i = 0; i < 12; i++) {
    if (notes[i] != null) {
      notes[i].show();
    }
  }
}

void displayPoints() {
  fill(255);
  rect(0, 0, 200, 120);
  fill(25, 0, 118);
  textSize(40);
  text("Points", 50, 50);
  text(Integer.toString(points), 90, 100);
}

void displayKey() {
  fill(255);
  rect(200, 0, 300, 120);
  fill(25, 0, 118);
  if (scale == 0) {
    text("Key:" + "\n" + "C Major", 200,50);
  } else if (scale == 1) {
    text("Key:" + "\n" + "C#/Db Major", 200,50);
  } else if (scale == 2) {
    text("Key:" + "\n" + "D Major", 200,50);
  } else if (scale == 3) {
    text("Key:" + "\n" + "D#/Eb Major", 200,50);
  } else if (scale == 4) {
    text("Key:" + "\n" + "E Major", 200,50);
  } else if (scale == 5) {
    text("Key:" + "\n" + "F Major", 200,50);
  } else if (scale == 6) {
    text("Key:" + "\n" + "F#/Gb Major", 200,50);
  } else if (scale == 7) {
    text("Key:" + "\n" + "G Major", 200,50);
  } else if (scale == 8) {
    text("Key:" + "\n" + "G#/Ab Major", 200,50);
  } else if (scale == 9) {
    text("Key:" + "\n" + "A Major", 200,50);
  } else if (scale == 10) {
    text("Key:" + "\n" + "A#/Bb Major", 200,50);
  } else if (scale == 11) {
    text("Key:" + "\n" + "B/Cb Major", 200,50);
  }
}

void displayLevel() {
  fill(255);
  rect(500, 0, 200, 120);
  fill(125, 0, 130);
  text("Level: " + Integer.toString(level), 350, 50);
  //next level
  if (notes[0] == null && notes[1] == null && notes[2] == null && notes[3] == null && notes[4] == null && notes[5] == null && notes[6] == null && lives > 0 && level <= 3) {
    if (level == 3) {
      level++;
    } else {
      level++;
      scale = (int) random(0,11);
      startLevel();
    }
  }
}


void displayLives() {
  fill(125, 0, 130);
  text("Lives: " + Integer.toString(lives), 550, 50);
}

void mouseClicked() {
  if (notes[0] != null && notes[0].isCollision()) {
    addPoint();
    notes[0] = null;
  } else if (notes[1] != null && notes[1].isCollision()) {
    addPoint();
    notes[1] = null;
  } else if (notes[2] != null && notes[2].isCollision()) {
    addPoint();
    notes[2] = null;
  } else if (notes[3] != null && notes[3].isCollision()) {
    addPoint();
    notes[3] = null;
  } else if (notes[4] != null && notes[4].isCollision()) {
    addPoint();
    notes[4] = null;
  } else if (notes[5] != null && notes[5].isCollision()) {
    addPoint();
    notes[5] = null;
  } else if (notes[6] != null && notes[6].isCollision()) {
    addPoint();
    notes[6] = null;
  } else if (notes[7] != null && notes[7].isCollision()) {
    subtractPoint();
    notes[7] = null;
  } else if (notes[8] != null && notes[8].isCollision()) {
    subtractPoint();
    notes[8] = null;
  } else if (notes[9] != null && notes[9].isCollision()) {
    subtractPoint();
    notes[9] = null;
  } else if (notes[10] != null && notes[10].isCollision()) {
    subtractPoint();
    notes[10] = null;
  } else if (notes[11] != null && notes[11].isCollision()) {
    subtractPoint();
    notes[11] = null;
  }
}

class MyMusic extends PdAlgorithm {
  Oscillator osc1 = new Oscillator();
  Line line = new Line();
  float amp = 0.9;
  float oscFreq = 440;
  double env = 0;
  boolean envBang = false;

  void runAlgorithm(double in1, double in2) {
    if (envBang) {
      env = line.perform(1, 5); 
    } else {
      env = line.perform(0, 300); 
    }
    outputL = outputR = osc1.perform(getFreq()) * (amp * (env*env));
  }
  synchronized void setFreq(float f1) {
    oscFreq = f1;
  }
  synchronized float getFreq() {
    return oscFreq;
  }
  synchronized void triggerAttack() {
    envBang = true;
  }
  synchronized void triggerRelease() {
     envBang = false; 
  }
  synchronized void free() {
    free(osc1);
  }
}
