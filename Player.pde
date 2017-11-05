public class Player {
  private Rectangle rectangle;
  private color playerColor;
  private int score;
  private int id;
  private final int paddleX = 30;
  private final int paddleY = 30;
 

  public Player(Rectangle rectangle, color playerColor, int id) {
    this.id = id;
    this.rectangle = rectangle;
    this.playerColor = playerColor;
  }

  public Rectangle getRectangle() {
    return rectangle;
  }

  public void setRectangle(Rectangle rectangle) {
    this.rectangle = rectangle;
  }

  public color getPlayerColor() {
    return playerColor;
  }

  public void setPlayerColor(color playerColor) {
    this.playerColor = playerColor;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public int getId() {
    return this.id;
  }
  
  public int getPaddleX() {
    return this.paddleX;
  }
  
  public int getPaddleY() {
    return this.paddleY;
  }

  void drawPlayer() {
    Rectangle r = this.getRectangle();
    scale(2);///
    
    //noFill(); 
    //strokeWeight(2); 
    //stroke(255, 0, 0);
    //rect(r.x, r.y, r.width, r.height);
  
    noStroke(); 
    fill(this.getPlayerColor());
    //ellipse(r.x + r.width/2, r.y + r.height/2, 30, 30);
    rectMode(CENTER);
    rect(r.x + r.width/2, r.y + r.height/2, this.paddleX, this.paddleY);
    println("Player:" + this.getId() + "X:"+ r.x + r.width/2 + " " + "Y:" + r.height/2);
    scale(0.5);///
  }
}