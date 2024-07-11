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
        int n;
        cin >> n;
        int arr[n];
        int brr[n];
        for (int i = 0; i < n; i++)
        {
            cin >> arr[i];
        }
        for (int i = 0; i < n; i++)
        {
            brr[i] = arr[i];
        }
        // if (n == 1)
        // {
        //     cout << arr[0] << endl;
        //     continue;
        // }
        sort(brr, brr + n);
        int f = 0;
        for (int i = 0; i < n; i++)
        {
            if (brr[i] != arr[i])
            {
                f = 1;
                break;
            }
        }
        if (f)
        {
            cout << brr[n - 1] + 1 << endl;
        }
        else
        {
            if (brr[0] - 1 > 0)
            {
                cout << brr[n - 1] - (brr[0] - 1) << endl;
            }
            else
            {
                cout << brr[n - 1] + 1 << endl;
            }
        }
    }
}