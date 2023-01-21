public class ShapeL extends Shape{
    public ShapeL ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc(PVector.add(startPosition, new PVector(0,0)), _colorShapeL));
            shapeElements.add(new Bloc(PVector.add(startPosition, new PVector(0,1)), _colorShapeL));
            shapeElements.add(new Bloc(PVector.add(startPosition, new PVector(0,2)), _colorShapeL));
            shapeElements.add(new Bloc(PVector.add(startPosition, new PVector(1,2)), _colorShapeL));
    }
}

public class ShapeLine extends Shape{
    public ShapeLine ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,0)), _colorShapeLine));
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,1)), _colorShapeLine));
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,2)), _colorShapeLine));
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,3)), _colorShapeLine));
    }
}

public class ShapeZ extends Shape{
    public ShapeZ ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,0)), _colorShapeZ));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,0)), _colorShapeZ));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,1)), _colorShapeZ));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(2,1)), _colorShapeZ));
    }
}

public class ShapeSquare extends Shape{
    public ShapeSquare ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,0)), _colorShapeSquare));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,1)), _colorShapeSquare));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,0)), _colorShapeSquare));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,1)), _colorShapeSquare));
    }
}

public class ShapeT extends Shape{
    public ShapeT ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,0)), _colorShapeT));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,1)), _colorShapeT));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,2)), _colorShapeT));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,1)), _colorShapeT));
    }
}
