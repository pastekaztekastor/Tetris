public class ShapeL extends Shape{

    public ShapeL ( PVector stratPosition) {
        super(stratPosition);
        this.colorShape = _colorShapeL;
        this.shapeElements = new ArrayList<PVector>();
            shapeElements.add(new PVector(0,0));
            shapeElements.add(new PVector(0,1));
            shapeElements.add(new PVector(0,2));
            shapeElements.add(new PVector(1,2));
    }
}