class ScoreBlockRow {
  int playerScore;
  int opponentScore;

  ScoreBlockRow(
    this.playerScore,
    this.opponentScore,
  );

  void setScore(int score) {
    playerScore = score;
  }

  void setOpponentScore(int score) {
    opponentScore = score;
  }

  String getScore() {
    return playerScore.toString();
  }

  String getOpponentScore() {
    return opponentScore.toString();
  }
}
