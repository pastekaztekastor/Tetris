public class Bloc {
    private PVector indexBloc;
    private color colorBloc;

    public Bloc (PVector indexBloc, color colorBloc) {
        this.indexBloc = indexBloc;
        this.colorBloc = colorBloc;
    }

    public void plot(PVector cornerBegin, float sizeCase) {
        fill(color(colorBloc,125));
        strokeWeight(2);
        stroke(colorBloc);
        rectMode(CORNER);
        rect(
            (cornerBegin.x + ((indexBloc.x)*sizeCase)) + sizeCase*.05,
            (cornerBegin.y + ((indexBloc.y)*sizeCase)) + sizeCase*.05,
            sizeCase*.9, 
            sizeCase*.9);
    }
    public PVector getIndex() {
        return indexBloc;
    }
    public void setIndex(PVector indexBloc) {
        this.indexBloc = indexBloc;
    }
    public void setIndex(int x, int y) {
        this.indexBloc.x += x;
        this.indexBloc.y += y;
    }
}
