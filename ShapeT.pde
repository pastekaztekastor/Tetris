public class ShapeT extends Shape{

    public ShapeT ( PVector stratPosition) {
        super(stratPosition);
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (new PVector(0,0), _colorShapeT));
            shapeElements.add(new Bloc (new PVector(0,1), _colorShapeT));
            shapeElements.add(new Bloc (new PVector(0,2), _colorShapeT));
            shapeElements.add(new Bloc (new PVector(1,1), _colorShapeT));
    }
}