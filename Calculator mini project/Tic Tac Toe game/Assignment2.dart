import 'dart:io';

void main() {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));
  String currentPlayer = 'X';

  for (int turn = 0; turn < 9; turn++) {
    printBoard(board);

    stdout.write('Player $currentPlayer, enter row (0, 1, or 2): ');
    int row = int.parse(stdin.readLineSync()!);

    stdout.write('Enter column (0, 1, or 2): ');
    int col = int.parse(stdin.readLineSync()!);

    if (isValidMove(row, col, board)) {
      board[row][col] = currentPlayer;

      if (checkWinner(board, currentPlayer)) {
        printBoard(board);
        print('Player $currentPlayer wins!');
        return;
      }

      currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
    } else {
      print('Invalid move. Try again.');
      turn--; // Decrement the turn to let the same player try again.
    }
  }

  printBoard(board);
  print('It\'s a draw!');
}

void printBoard(List<List<String>> board) {
  for (List<String> row in board) {
    print(row.join(' | '));
    print('-' * 9);
  }
}

bool isValidMove(int row, int col, List<List<String>> board) {
  return (0 <= row && row < 3 && 0 <= col && col < 3 && board[row][col] == ' ');
}

bool checkWinner(List<List<String>> board, String player) {
  for (int i = 0; i < 3; i++) {
    if (board[i].every((cell) => cell == player) ||
        board.every((row) => row[i] == player)) {
      return true;
    }
  }

  if (board.every((row) => row.every((cell) => cell == player)) ||
      board[0][0] == player && board[1][1] == player && board[2][2] == player ||
      board[0][2] == player && board[1][1] == player && board[2][0] == player) {
    return true;
  }

  return false;
}
