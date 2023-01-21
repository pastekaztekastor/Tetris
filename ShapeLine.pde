public class ShapeLine extends Shape{

    public ShapeLine ( PVector stratPosition) {
        super(stratPosition);
        this.colorShape = _colorShapeLine;
        this.shapeElements = new ArrayList<PVector>();
            shapeElements.add(new PVector(0,0));
            shapeElements.add(new PVector(0,1));
            shapeElements.add(new PVector(0,2));
            shapeElements.add(new PVector(0,3));
    }
}
