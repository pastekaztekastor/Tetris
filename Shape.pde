abstract class Shape{

    protected PVector positionIndex; // index PositionIndex
    protected color colorShape;
    protected Orientation orientation;
    protected ArrayList<PVector> shapeElements; // index des composantes de la shape

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
        for (PVector shapeElement : shapeElements) {
            // affiche les carré qui coimpose la shape
            fill(color(colorShape,125));
            strokeWeight(3);
            stroke(colorShape);
            rectMode(CORNER);
            rect(
                cornerBegin.x + ((shapeElement.x+positionIndex.x)*sizeCase) ,
                cornerBegin.y + ((shapeElement.y+positionIndex.y)*sizeCase),
                sizeCase, 
                sizeCase);
        }
    }

    public color getColor() {
        return colorShape;
    }

    public ArrayList<PVector> getAbsolutIndexShapeElement() {
        ArrayList<PVector> out = new ArrayList<PVector>();
        for (PVector shapeElement : shapeElements) {
            out.add(new PVector(shapeElement.x+this.positionIndex.x, shapeElement.y+this.positionIndex.y));
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
                for (PVector shapeElement : shapeElements) {
                    float x = shapeElement.x;
                    shapeElement.x = shapeElement.y;
                    shapeElement.y = x;
                }
                orientation = Orientation.TOP;
            case TOP :
            case BOTTOM : 
                // symétrie vertical
                float maxX = 0;
                for (PVector shapeElement : shapeElements) {
                    maxX = max(maxX, shapeElement.x);
                }
                for (PVector shapeElement : shapeElements) {
                    shapeElement.x = maxX-shapeElement.x;
                }
                orientation = Orientation.LEFT;
                break;	
        }
    }
}
