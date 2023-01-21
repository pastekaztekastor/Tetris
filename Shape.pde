abstract class Shape{

    protected Orientation orientation;
    protected ArrayList<Bloc> shapeElements; 

    protected Shape () {
        this.orientation = Orientation.TOP;
    }

    protected boolean bottomColision(PVector grideDim, ArrayList<PVector> bannedIndex) {
        boolean out = false;
        for (PVector indexTested : this.getAbsolutIndexShapeElement()) {
            if (indexTested.y >= grideDim.y || bannedIndex.contains(indexTested)) {
                out = true;
                break;
            }
        }
        return out;
    }
    protected boolean sideColision(PVector grideDim, ArrayList<PVector> bannedIndex) {
        boolean out = false;
        for (PVector indexTested : this.getAbsolutIndexShapeElement()) {
            if ( indexTested.x < 0 || indexTested.x >= grideDim.x || bannedIndex.contains(indexTested)) {
                out = true;
                break;
            }
        }
        return out;
    }
    protected void plot(PVector cornerBegin, float sizeCase) {
        for (Bloc shapeElement : shapeElements) {
            // affiche les carré qui coimpose la shape
            shapeElement.plot(cornerBegin, sizeCase);
        }
    }
    public ArrayList<PVector> getAbsolutIndexShapeElement() {
        ArrayList<PVector> out = new ArrayList<PVector>();
        for (Bloc shapeElement : shapeElements) {
            out.add(shapeElement.getIndex());
        }
        return out;
    }
    public void move(Move move){
        switch (move) {
            case DOWN :
                for (Bloc bloc : shapeElements) {
                    bloc.setIndex(0,1);
                }
                break;	
            case RIGHT :
                for (Bloc bloc : shapeElements) {
                    bloc.setIndex(1,0);
                }
                break;	
            case LEFT :
                for (Bloc bloc : shapeElements) {
                    bloc.setIndex(-1,0);
                }
                break;
            case ROTATE : 
                rotate();
                break;
        }
    }
    public void undoMove(Move move) {
        switch (move) {
            case DOWN :
                for (Bloc bloc : shapeElements) {
                    bloc.setIndex(0,-1);
                }
                break;	
            case RIGHT :
                for (Bloc bloc : shapeElements) {
                    bloc.setIndex(-1,0);
                }
                break;	
            case LEFT :
                for (Bloc bloc : shapeElements) {
                    bloc.setIndex(1,0);
                }
                break;
            case ROTATE : 
                rotate();
                rotate();
                rotate();
                break;
        }
    }
    public void rotate() {
        // on vas faire des symtrie diag pour 1 cas sur 2
        // de symétrie horizon + diag pour les deux autres. 
        
    }
    public ArrayList<Bloc> getShapElements() {
        return shapeElements;
    }
}
