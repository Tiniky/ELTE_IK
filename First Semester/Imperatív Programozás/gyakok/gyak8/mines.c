#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ctype.h>

#define SIZE 10 // játékmező mérete
#define MINES_MAX 30 // aknák száma maximum
#define MINES_MIN 3 // aknák száma minimum


// mező kiírása
void printField(char field[SIZE][SIZE], char uncovered[SIZE][SIZE]) {
    printf("  ");
    // oszlopcimkék kiírasa
    for(int i = 0; i < SIZE; i++) {
        printf("%c ", 'A'+i);
    }
    printf("\n");
    for(int i = 0; i < SIZE; i++) {
        // sorcimke
        printf("%d ", i);
        for(int j = 0; j < SIZE; j++) {
            // ha az adott cella fel lett fedve, akkor kiirja az adott helyen levő karaktert
            // egyébként szóközt ír arra a helyre
            printf("%c ", (uncovered[i][j]) ? '0' + field[i][j] : ' ');
        }
        printf("\n");
    }
}

// aknák elhelyezése
void placeMines(char field[10][10], int mineCount) {
    for(int i = 0; i < mineCount; i++) {
        int x, y;
        do {
            // generál egy random x és y koordinátát
            x = rand() % 10;
            y = rand() % 10;
            // ha az adott helyen már akna van, akkor újragenerálja
        } while(field[x][y] == -1);
        field[x][y] = -1;
    }
}

// cellaértékek feltöltése (környező aknák száma)
void fillField(char field[SIZE][SIZE]) {
    // végigmegyünk az összes cellán
    for(int i = 0; i < SIZE; i++) {
        for(int j = 0; j < SIZE; j++) {
            // ha az adott cella akna, akkor azt kihagyjuk
            if(field[i][j] == -1) continue;

            int mines = 0;
            // bejárjuk a cella 3x3-mas környékét, megszámolva hány akna van ott
            for(int ii = i-1; ii <= i+1; ii++) {
                for(int jj = j-1; jj <= j+1; jj++) {
                    // leellenőrizzük hogy nem lépünk-e le a tábláról, nem indexelünk túl vagy alul
                    if(ii >= 0 && jj >= 0 && ii < SIZE && jj < SIZE) {
                        if(field[ii][jj] == -1) mines++;
                    }
                }
            }
            field[i][j] = mines;
        }
    }
}

int main(int argc, char** argv) {

    // ha nem adja meg a játékos az aknák számát akkor kilép a program
    if(argc != 2) {
        printf("Add meg az aknak szamat pls\n");
        exit(1);
    }

    srand(time(0));

    char field[SIZE][SIZE] = {0};
    char uncovered[SIZE][SIZE] = {0};

    // aknák száma int-é konvertálva
    int mineCount = atoi(argv[1]);
    if(mineCount < MINES_MIN || mineCount > MINES_MAX) {
        printf("Kerlek rendes szamot adj meg [3;30] kozott\n");
        exit(1);
    }

    placeMines(field, mineCount);
    fillField(field);
    printField(field, uncovered);

    // nem aknát tartalmazó mezők száma
    int fieldsUncovered = SIZE * SIZE - mineCount;
    int foundMine = 0;

    // ciklus amíg nem talált a játékos aknát vagy fel nem fedett mindent
    while(!foundMine && fieldsUncovered > 0) {
        printf("> ");
        char line[20];
        // az egész sort beolvassuk egyszerre
        fgets(line, sizeof(line), stdin);
        char col;
        int row;
        // a sorból kiemeljük az oszlop és sorindexeket
        sscanf(line, "%c%d", &col, &row);
        int x = row;
        // toupper: nagybetűvé konvertál, a ctype.h library-ben van
        int y = toupper(col) - 'A';

        // ha helytelen cellaindexet ad meg a játékos
        if(x < 0 || x >= SIZE || y < 0 || y >= SIZE) {
            printf("Hibas mezo!\n");
            continue;
        }

        // cella felfedése, ha akna akkor vesztett a játékos, egyébként cellaszámból kivonunk 1-et
        uncovered[x][y] = 1;
        if(field[x][y] == -1) foundMine = 1;
        else fieldsUncovered--;

        printField(field, uncovered);

    }
    if(foundMine) {
        printf("Bocsi vesztettel\n");
    }
    else {
        printf("GG\n");
    }

    return 0;
}