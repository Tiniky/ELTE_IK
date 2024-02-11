#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>

#define SIZE 10

void initBoards(int mine_count, int board[][SIZE], int visible_board[][SIZE]) {
    for(int i = 0; i < SIZE; ++i) {
        for(int j = 0; j < SIZE; ++j) {
            board[i][j] = 0;
            visible_board[i][j] = 0;
        }
    }

    for(int i = 0; i < mine_count; ++i) {
        int x = rand() % SIZE;
        int y = rand() % SIZE;

        while(board[x][y] == -1) {
            x = rand() % SIZE;
            y = rand() % SIZE;
        }

        board[x][y] = -1;
    }
}

void drawBoard(int board[][SIZE], int visible_board[][SIZE]) {
    printf("\n\n ");
    for(int i = 0; i < SIZE; ++i) {
        printf(" %d", i);
    }
    printf("\n\n");


    for(int i = 0; i < SIZE; ++i) {
        printf("%c ", 'A' + i);
        /*
            visible_board[i][j] ==
             0: field is hidden
             1: field is visible
            -1: field is flagged
        */
        for(int j = 0; j < SIZE; ++j) {
            switch(visible_board[i][j]) {
                case 0:
                    printf("  ");
                    break;
                case 1:
                    printf("%d ", board[i][j]);
                    break;
                case -1:
                    printf("X ");
                    break;
            }
        }
        printf("\n");
    }
}

void countNeigbourgingMines(int board[][SIZE]) {
    for(int i = 0; i < SIZE; ++i) {
        for(int j = 0; j < SIZE; ++j) {
            if(board[i][j] != -1) {
                if(j + 1 < SIZE) {
                    if(board[i][j + 1] == -1) {
                        ++board[i][j];
                    }
                }

                if(j - 1 >= 0) {
                    if(board[i][j - 1] == -1) {
                        ++board[i][j];
                    }
                }

                if(i + 1 < SIZE) {
                    if(board[i + 1][j] == -1) {
                        ++board[i][j];
                    }
                }

                if(i - 1 >= 0) {
                    if(board[i - 1][j] == -1) {
                        ++board[i][j];
                    }
                }

                if(i + 1 < SIZE && j + 1 < SIZE) {
                    if(board[i + 1][j + 1] == -1) {
                        ++board[i][j];
                    }
                }

                if(i + 1 < SIZE && j - 1 >= 0) {
                    if(board[i + 1][j - 1] == -1) {
                        ++board[i][j];
                    }
                }

                if(i - 1 >= 0 && j - 1 >= 0) {
                    if(board[i - 1][j - 1] == -1) {
                        ++board[i][j];
                    }
                }

                if(i - 1 >= 0 && j + 1 < SIZE) {
                    if(board[i - 1][j + 1] == -1) {
                        ++board[i][j];
                    }
                }
            }
        }
    }
}

int main(int argc, char* argv[]) {
    int mine_count;
    if(argc == 2) {
        mine_count = atoi(argv[1]);
        if(mine_count < 3 || mine_count > 30) {
            printf("Mine count has to be between 3 and 30.\n");
            exit(1);
        }
    } else {
        printf("Please supply the mine count as an argument.\n");
        exit(1);
    }
    srand(time(NULL));

    int board[SIZE][SIZE];
    int visible_board[SIZE][SIZE];
    
    initBoards(mine_count, board, visible_board);
    countNeigbourgingMines(board);

    for(int i = 0; i < SIZE; i++) {
        for(int j = 0; j < SIZE; j++) {
            printf("%2d ", board[i][j]);
        }
        printf("\n");
    }

    bool game_over = false;
    int flagged_mines = 0;
    int visible_fields = 0;
    while(!game_over) {
        bool mine_hit = false;
        drawBoard(board, visible_board);
        printf("Enter coordinates: ");
        char row;
        int col;
        char op;
        scanf("%c%d%c", &row, &col, &op);
        // printf("%c %d %c", row, col, op);

        if(op == 'F') {
            int nRow = row - 65;
            visible_board[nRow][col] = -1;
            if(board[nRow][col] == -1) {
                flagged_mines++;
            }
        } else {
            int nRow = row - 65;
            visible_board[nRow][col] = 1;
            visible_fields++;
            if(board[nRow][col] == -1) {
                mine_hit = true;
            }
        }

        game_over = mine_hit || (visible_fields == (SIZE*SIZE) - mine_count) || flagged_mines == mine_count;
    }
    printf("Game over!\n");
    return 0;
}