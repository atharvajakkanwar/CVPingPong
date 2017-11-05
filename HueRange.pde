public class HueRange {
  private int  lowerLimit;
  private int  higherLimit;

public HueRange(int low, int high) {
  this.lowerLimit =low;
  this.higherLimit =high;
}
  public int getLowerLimit() {
    return lowerLimit;
  }

  public void setLowerLimit(int lowerLimit) {
    this.lowerLimit = lowerLimit;
  }

  public int getHigherLimit() {
    return higherLimit;
  }

  public void setHigherLimit(int higherLimit) {
    this.higherLimit = higherLimit;
  }
}