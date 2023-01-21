public class ShapeSquare extends Shape{

    public ShapeSquare ( PVector stratPosition) {
        super(stratPosition);
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (new PVector(0,0), _colorShapeSquare));
            shapeElements.add(new Bloc (new PVector(0,1), _colorShapeSquare));
            shapeElements.add(new Bloc (new PVector(1,0), _colorShapeSquare));
            shapeElements.add(new Bloc (new PVector(1,1), _colorShapeSquare));
    }
}
