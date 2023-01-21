public class ShapeT extends Shape{

    public ShapeT ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,0)), _colorShapeT));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,1)), _colorShapeT));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(0,2)), _colorShapeT));
            shapeElements.add(new Bloc (PVector.add(startPosition,new PVector(1,1)), _colorShapeT));
    }
}