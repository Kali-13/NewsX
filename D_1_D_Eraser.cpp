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
        int n, k;
        cin >> n >> k;
        string s;
        cin >> s;

        int ma = 0;
        for (int i = 0; i < n;)
        {
            if (s[i] == 'B')
            {
                ma++;
                i += k;

                // for(int j=i;j<i+k-1&&j<n;j++){

                // }
            }
            else
            {
                i++;
            }
        }
        cout << ma << endl;
    }
}