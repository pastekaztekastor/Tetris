public class ShapeT extends Shape{

    public ShapeT ( PVector stratPosition) {
        super(stratPosition);
        this.colorShape = _colorShapeT;
        this.shapeElements = new ArrayList<PVector>();
            shapeElements.add(new PVector(0,0));
            shapeElements.add(new PVector(0,1));
            shapeElements.add(new PVector(0,2));
            shapeElements.add(new PVector(1,1));
    }
}