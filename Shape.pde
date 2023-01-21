abstract class Shape{

    protected PVector positionIndex; 
    protected Orientation orientation;
    protected ArrayList<Bloc> shapeElements; 

    protected Shape (PVector stratPosition) {
        this.positionIndex = stratPosition;
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
            out.add( PVector.add(this.positionIndex, shapeElement.getIndex()));
        }
        return out;
    }
    public void move(Move move){
        switch (move) {
            case DOWN :
                positionIndex.y++;
                break;	
            case RIGHT :
                positionIndex.x++;
                break;	
            case LEFT :
                positionIndex.x--;
                break;
            case ROTATE : 
                rotate();
                break;
        }
    }
    public void undoMove(Move move) {
        switch (move) {
            case DOWN :
                positionIndex.y--;
                break;	
            case RIGHT :
                positionIndex.x--;
                break;	
            case LEFT :
                positionIndex.x++;
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
        switch (orientation) {
            case LEFT :
            case RIGHT :
                // symétrie diag
                for (Bloc shapeElement : shapeElements) {
                    float x = shapeElement.getIndex().x;
                    shapeElement.getIndex().x = shapeElement.getIndex().y;
                    shapeElement.getIndex().y = x;
                }
                orientation = Orientation.TOP;
            case TOP :
            case BOTTOM : 
                // symétrie vertical
                float maxX = 0;
                for (Bloc shapeElement : shapeElements) {
                    maxX = max(maxX, shapeElement.getIndex().x);
                }
                for (Bloc shapeElement : shapeElements) {
                    shapeElement.getIndex().x = maxX-shapeElement.getIndex().x;
                }
                orientation = Orientation.LEFT;
                break;	
        }
    }
    public ArrayList<Bloc> getShapElements() {
        return shapeElements;
    }
}
