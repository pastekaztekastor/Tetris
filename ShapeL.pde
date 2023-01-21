public class ShapeL extends Shape{

    public ShapeL ( PVector stratPosition) {
        super(stratPosition);
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc(new PVector(0,0), _colorShapeL));
            shapeElements.add(new Bloc(new PVector(0,1), _colorShapeL));
            shapeElements.add(new Bloc(new PVector(0,2), _colorShapeL));
            shapeElements.add(new Bloc(new PVector(1,2), _colorShapeL));
    }
}