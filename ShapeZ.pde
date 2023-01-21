public class ShapeZ extends Shape{

    public ShapeZ ( PVector stratPosition) {
        super(stratPosition);
        this.colorShape = _colorShapeZ;
        this.shapeElements = new ArrayList<PVector>();
            shapeElements.add(new PVector(0,0));
            shapeElements.add(new PVector(1,0));
            shapeElements.add(new PVector(1,1));
            shapeElements.add(new PVector(2,1));
    }
}
