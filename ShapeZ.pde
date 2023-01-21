public class ShapeZ extends Shape{

    public ShapeZ ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,0)), _colorShapeZ));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,0)), _colorShapeZ));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,1)), _colorShapeZ));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(2,1)), _colorShapeZ));
    }
}
