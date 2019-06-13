//alle variabelen
float rt;
float rtmin;
float rtmax;
int i=0;
float tijd = 1;
float cmax = 10;
// de x en y van de lijntjes boven en onder
float lx;
float ly;
//back ground
float bg = 255;
float time;
float divi;
int telleraantal = 1;
int teller;
boolean run = true;
float figuren;
int knopaanslagen;

//kleuren max en min
float maxkleur;
float minkleur;
float maxrood ;
float minrood ;
float maxgroen;
float mingroen ;
float maxblauw;
float minblauw;
float maxhue;
float minhue;
//tekst
PFont f;

void setup() {
  size(1800, 1000);  
  // maxrand en minimum rand
  rtmin = 50; rtmax = height/2;  
  // rand
  lx = rt; divi = random(2, 15); rt = random(rtmin, rtmax);  
  //achtergrond
  bg = random(200, 255); background(bg);
  //kleuren van cirkels maxima minima
  maxrood = random(255);  minrood = random(255);  maxgroen = random(255);  mingroen = random(255);  maxblauw = random(255);  minblauw = random(255);  maxhue = random(255);minhue = random(255);

  // Create the font
  printArray(PFont.list());
  f = createFont("Helvetica", 20);
  textFont(f);
}

void draw() {
  bgaanaf();
  kleurencirkels();
  controleTS();
  lijntjes();
  tekstje();
  println(teller);
}

void bgaanaf() {
  // druk op 'b' en 'v' voor de achtergrond te verbergen, tonen
  noStroke();
  if (key == 'b') {
      fill(255, 255, 255, bg);
  rect(0, 0, width, height);
    bg = 255;
    figuren = 0;
  } 
    if (key == 'v') {
        bg = random(0,255);
  fill(bg);
  rect(0, 0, width, height);
  lijntjes();
  }
}

void kleurencirkels() {
  // schaap
  float framerood = random(maxrood, minrood);
  float framegroen = random(maxgroen, mingroen);
  float frameblauw = random(maxblauw, minblauw);
  float framehue = random(minhue, maxhue);
  if (run){
  while (i < tijd) {
    i += 1;
    figuren += 1;
    noStroke();
    fill(framerood, framegroen, frameblauw, framehue);
    ellipse(random(rt, width-rt), random(rt, height-rt), random(0.1, cmax), random(0.1, cmax));
   //ellipse(mouseX, mouseY, random(1, 100), random(1, 100));
    //contrasterend kleurtje per aantal frames
    
    if (teller >= telleraantal) {
      teller = 0;
      figuren += 1;
      fill(255-framerood, 255-framegroen, 255-frameblauw, 255-framehue);
      ellipse(random(rt, width-rt), random(rt, height-rt), random(0.1, cmax), random(0.1, cmax));
    }
  }
  }
}

void controleTS(){
    if (key == 's') {
      //stop()
    run = false;
  } 
      if (key == 'd') {
      //start()
    run = true;
    tijd += 1; 
    teller +=1;
  } else {
    tijd += 1; 
    teller +=1;
  }
}
void lijntjes(){
    //beginconditie voor de lijntjes
    lx = rt;
    ly = rt;
  //rand streepjes
  while (i < 20){
    i+=1;
  stroke(1);
  fill(255-bg);
  line(lx, 0, lx, rt/divi);
  line(lx, height-(rt/divi), lx, height);
  line(0, ly, rt/divi, ly);
  line(width, ly, width-(rt/divi), ly);
  divi = random(2, 15);
  lx += rt;
  ly += rt;
  noStroke();
  }
}
void tekstje(){
  textAlign(CENTER);
  drawType(width * 0.1);
}
void drawType(float x) {
  text("S = stop, D = play", x, height-30);
  fill(0.5);
  text("B = reset    V = strobe", x + 50, height-10);
  fill(255);
  rect (540, height-40, 260, 40);
    fill(25);
  text(tijd, x + 590, height-10);
  text(figuren, x + 500, height-10);
  text(rt, x + 400, height-10);
}
