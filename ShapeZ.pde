public class ShapeZ extends Shape{

    public ShapeZ ( PVector stratPosition) {
        super(stratPosition);
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (new PVector(0,0), _colorShapeZ));
            shapeElements.add(new Bloc (new PVector(1,0), _colorShapeZ));
            shapeElements.add(new Bloc (new PVector(1,1), _colorShapeZ));
            shapeElements.add(new Bloc (new PVector(2,1), _colorShapeZ));
    }
}
