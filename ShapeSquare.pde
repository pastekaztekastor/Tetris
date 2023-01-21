public class ShapeSquare extends Shape{

    public ShapeSquare ( PVector stratPosition) {
        super(stratPosition);
        this.colorShape = _colorShapeSquare;
        this.shapeElements = new ArrayList<PVector>();
            shapeElements.add(new PVector(0,0));
            shapeElements.add(new PVector(0,1));
            shapeElements.add(new PVector(1,0));
            shapeElements.add(new PVector(1,1));
    }
}
