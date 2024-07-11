#include <bits/stdc++.h>
#define yes cout << "yes" << endl
#define no cout << "no" << endl
using namespace std;
int main()
{
    int t;
    cin >> t;
    while (t--)
    {

        char board[10][10];
        for (int i = 0; i < 10; i++)
        {
            for (int j = 0; j < 10; j++)
            {
                cin >> board[i][j];
            }
        }
        int point = 0;

        for (int i = 0; i < 10; i++)
        {
            for (int j = 0; j < 10; j++)
            {

                if (board[i][j] == '.')
                {
                    continue;
                }

                if (board[i][j] == 'X' && (i == 0 || j == 0 || j == 9 || i == 9))
                {
                    point += 1;
                }
                else if (((i == 1 || i == 8) && j > 0 && j < 9) || ((j == 1 || j == 8) && i > 0 && i < 9))
                {
                    point += 2;
                }
                else if (((i == 2 || i == 7) && (j > 1 && j < 8)) || ((j == 2 || j == 7) && (i > 1 && i < 8)))
                {
                    point += 3;
                }
                else if (((i == 3 || i == 6) && (j > 2 && j < 7)) || ((j == 3 || j == 6) && (i > 2 && i < 7)))
                {
                    point += 4;
                }
                else
                {
                    point += 5;
                }
            }
        }

        cout << point << endl;
    }
}