public class ShapeLine extends Shape{

    public ShapeLine ( PVector startPosition) {
        this.shapeElements = new ArrayList<Bloc>();
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,0)), _colorShapeLine));
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,1)), _colorShapeLine));
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,2)), _colorShapeLine));
            shapeElements.add(new Bloc (PVector.add(startPosition, new PVector(0,3)), _colorShapeLine));
    }
}
