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
        string s;
        cin >> s;

        if (s[0] != 'a' && s[1] != 'b' && s[2] != 'c')
        {
            cout << "NO" << endl;
        }
        else
        {
            yes;
        }
    }
}