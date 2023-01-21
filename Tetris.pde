final color _colorCase       = color(125, 125, 125);
final color _colorLine       = color(200, 200, 200);
final color _colorBg         = color(100, 100, 100);

final color _colorShapeSquare = color(200, 000, 000);
final color _colorShapeLine  = color(000, 200, 000);
final color _colorShapeZ  = color(000, 200, 200);
final color _colorShapeT  = color(000, 000, 200 );
final color _colorShapeL  = color(200, 200, 000);

Gride gride;
PVector grideDim;

int _millisBeg = millis();
int _millisInput = millis();

int score, level; // TO DO
int [] levelStep; // TO DO

static enum Orientation{
    TOP, LEFT, BOTTOM, RIGHT
}
static enum Move{
    UP, LEFT, DOWN, RIGHT, ROTATE, BOTTOM
}

void setup() {
    size(300,600,P2D);
    //levelStep = [0, 100, 200, 500];
    grideDim = new PVector(10,20);
    gride = new Gride(grideDim);
    gride.appaerShape();
}

void draw() {
    gride.plotGride();
    gride.plotShapes();
    if (millis() - _millisBeg > 100){
        _millisBeg = millis();
        gride.animate(Move.DOWN);
    }
    plotHUD();
}

void plotHUD(){
    //TO DO
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == LEFT) gride.animate(Move.LEFT);
        if (keyCode == RIGHT) gride.animate(Move.RIGHT);
        if (keyCode == DOWN) {
            if (millis()-_millisInput <20) {
                gride.animate(Move.BOTTOM);
            }
            else {
                gride.animate(Move.DOWN);
            }
            _millisInput = millis();
        }
    }
    if (key == ' ') gride.animate(Move.ROTATE);
}
