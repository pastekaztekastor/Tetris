abstract class Shape{

    protected ArrayList<Bloc> shapeElements; 
    int scoreValue;

    protected Shape () {
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
        PVector shapeDimension;
        PVector shapePosition;

        float[] indexX = new float[shapeElements.size()];
        float[] indexY = new float[shapeElements.size()];
        
        PVector relativeIndex;
        // VERTICAL
        for (int i = 0; i < shapeElements.size(); i++) {
            indexX[i] = shapeElements.get(i).getIndex().x;
            indexY[i] = shapeElements.get(i).getIndex().y;
        }
        shapePosition = new PVector(min(indexX), min(indexY));
        shapeDimension = new PVector(max(indexX), max(indexY));
        shapeDimension.sub(shapePosition);

        for (Bloc bloc : shapeElements) {
            relativeIndex = PVector.sub(bloc.getIndex(), shapePosition);
            bloc.setIndex(PVector.add(shapePosition, new PVector(shapeDimension.x - relativeIndex.x , relativeIndex.y)));
        }

        // DIAGONAL
        // VERTICAL
        for (int i = 0; i < shapeElements.size(); i++) {
            indexX[i] = shapeElements.get(i).getIndex().x;
            indexY[i] = shapeElements.get(i).getIndex().y;
        }
        shapePosition = new PVector(min(indexX), min(indexY));
        shapeDimension = new PVector(max(indexX), max(indexY));
        shapeDimension.sub(shapePosition);

        for (Bloc bloc : shapeElements) {
            relativeIndex = PVector.sub(bloc.getIndex(), shapePosition);
            PVector invers = new PVector(relativeIndex.y, relativeIndex.x);
            bloc.setIndex(PVector.add(shapePosition, invers));
        }
        // On peut amélioré en "centrant la figure"
    }
    public ArrayList<Bloc> getShapElements() {
        return shapeElements;
    }

    public int getScoreValue() {
        return scoreValue;
    }
}
