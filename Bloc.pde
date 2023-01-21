public class Bloc {
    private PVector indexBloc;
    private color colorBloc;

    public Bloc (PVector indexBloc, color colorBloc) {
        this.indexBloc = indexBloc;
        this.colorBloc = colorBloc;
    }

    public void plot(PVector cornerBegin, float sizeCase) {
        fill(color(colorBloc,125));
        strokeWeight(3);
        stroke(colorBloc);
        rectMode(CORNER);
        rect(
            cornerBegin.x + ((indexBloc.x)*sizeCase) ,
            cornerBegin.y + ((indexBloc.y)*sizeCase),
            sizeCase, 
            sizeCase);
    }
    public int getLine() {
        return (int)indexBloc.y;
    }
    public void moveDown() {
        indexBloc.y++;
    }
    public PVector getIndexBloc() {
        return indexBloc;
    }
}
