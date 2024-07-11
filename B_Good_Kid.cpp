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
        for (int i = 0; i < n; i++)
        {
            cin >> arr[i];
        }
        sort(arr, arr + n);
        arr[0] = arr[0] + 1;
        long long pro = 1;
        for (int i = 0; i < n; i++)
        {
            pro *= arr[i] * 1LL;
        }
        cout << pro << endl;
    }
}