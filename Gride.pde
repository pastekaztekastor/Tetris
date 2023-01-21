public class Gride{

    private float sizeCase;
    private PVector windowMidle;
    private PVector grideSize;
    private PVector cornerBegin;
    private PVector cornerEnd;
    private PVector grideDim;

    private int shapeType;

    private boolean endGame;
    private ArrayList<Bloc> blocs; 

    private Shape movedShape;

    public Gride (PVector grideDim) {
        this.grideDim        = grideDim;
        this.sizeCase        = min((width-20)/grideDim.x, (height-20)/grideDim.y);
        this.windowMidle     = new PVector(width/2, height/2);
        this.grideSize       = new PVector(grideDim.x*sizeCase, grideDim.y*sizeCase);
        this.cornerBegin     = new PVector(windowMidle.x-grideSize.x/2, windowMidle.y-grideSize.y/2);
        this.cornerEnd       = new PVector(windowMidle.x+grideSize.x/2, windowMidle.y+grideSize.y/2); 
        this.blocs           = new ArrayList<Bloc>();
        this.shapeType       = (int)random(0, 5);
        this.endGame         = false;
    }

    public void appaerShape(){
        if (! endGame) {
            switch (shapeType) {
                case 0 :
                    movedShape = new ShapeSquare ( new PVector(1, 1));
                    break;	
                case 1 :
                    movedShape = new ShapeLine ( new PVector(1, 1));
                    break;	
                case 2 :
                    movedShape = new ShapeT ( new PVector(1, 1));
                    break;	
                case 3 :
                    movedShape = new ShapeZ ( new PVector(1, 1));
                    break;	
                case 4 :
                    movedShape = new ShapeL ( new PVector(1, 1));
                    break;	
            }   
            shapeType = (int)random(0, 5);
        }
        if (endGame()) {
            println("fin de game");
            endGame = true;
        }
    }

    public void plotGride() {
        background(_colorBg);

        stroke(_colorCase);
        strokeWeight(1);
        fill(_colorCase);
        rectMode(CORNERS);
        rect(cornerBegin.x, cornerBegin.y, cornerEnd.x, cornerEnd.y);

        // vertical Line
        for (float i = cornerBegin.x; i <= cornerEnd.x; i+=sizeCase) {
            stroke(_colorLine);
            line(i, cornerBegin.y, i, cornerEnd.y);
        }
        // horizontal Line
        for (float i = cornerBegin.y; i <= cornerEnd.y; i+=sizeCase) {
            stroke(_colorLine);
            line(cornerBegin.x, i, cornerEnd.x, i);
        }
    }
    public void plotShapes(){
        for (Bloc bloc : blocs) {
            bloc.plot(cornerBegin, sizeCase);
        }
        movedShape.plot(cornerBegin, sizeCase);
    }

    public void animate(Move move){
        if (! endGame) {    
            switch (move) {
                case DOWN : 
                    movedShape.move(move);
                    if (movedShape.bottomColision(grideDim, this.getBannedIndex())){
                        movedShape.undoMove(move);
                        this.blocs.addAll(movedShape.getShapElements());
                        appaerShape();
                    }
                    break;
                case LEFT :
                case RIGHT : 
                    movedShape.move(move);
                    if (movedShape.sideColision(grideDim, this.getBannedIndex())){
                        movedShape.undoMove(move);
                    }    
                    break;
                case ROTATE : 
                    movedShape.move(move);
                    if (movedShape.sideColision(grideDim, this.getBannedIndex()) || movedShape.bottomColision(grideDim, this.getBannedIndex())){
                        movedShape.undoMove(move);
                    }    
                    break;
                case BOTTOM : 
                    while (! movedShape.bottomColision(grideDim, this.getBannedIndex())) {
                        movedShape.move(Move.DOWN);
                    }
                    movedShape.undoMove(Move.DOWN);
                    this.blocs.addAll(movedShape.getShapElements());
                    appaerShape();
            }
            if (indexFullLine().size() > 0){
                deletLine(indexFullLine());
            }
        }
    }

    public ArrayList<Integer> indexFullLine() {
        ArrayList<Integer> out = new ArrayList<>();
        // si un ligne et pleine retourne l'indice de cette ligne
        for (int curentLine = 0; curentLine < grideDim.y ; curentLine++) {
            ArrayList<Bloc> blocsAtLine = new ArrayList<Bloc>();
            for (Bloc bloc : blocs) {
                if((int)bloc.getIndex().y == curentLine){
                    blocsAtLine.add(bloc);
                }
            }
            if (blocsAtLine.size() == grideDim.x){
                out.add(curentLine);
            }
        }
        return out;
    }

    public void deletLine(ArrayList<Integer> lines){
        for (Integer line : lines) {
            ArrayList<Bloc> testedBlocs = new ArrayList<>();
            testedBlocs.addAll(blocs);
            for (Bloc bloc : testedBlocs) {
                if((int)bloc.getIndex().y == line){
                    blocs.remove(bloc);
                }
            } 
            for (Bloc bloc : blocs) {
                if ((int)bloc.getIndex().y < line) {
                    bloc.setIndex(0,1);
                }
            }
        }
    }
    
    public boolean endGame() {
        boolean out = false;
        for (PVector shapeElement : movedShape.getAbsolutIndexShapeElement()) {
            if (this.getBannedIndex().contains(shapeElement)) {
                out = true;
                break;
            }
        }
        return out;
    }

    private ArrayList<PVector> getBannedIndex() {
        ArrayList<PVector> out = new ArrayList();
        for (Bloc bloc : blocs) {
            out.add(bloc.getIndex());
        }
        return out;
    }
}
