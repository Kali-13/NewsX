#include <bits/stdc++.h>
#define yes cout << "yes" << endl
#define no cout << "no" << endl
using namespace std;
bool check(long long arr[], long long n, long long m, long long k)
{
    long long c = 0;
    for (int i = 0; i < n; i++)
    {
        if (arr[i] < m)
        {
            c += (m - arr[i]);
        }
    }
    return c <= k;
}
int main()
{
    int t;
    cin >> t;
    while (t--)
    {
        int n;
        long long x;
        cin >> n >> x;
        long long arr[n];
        for (int i = 0; i < n; i++)
        {
            cin >> arr[i];
        }

        long long l = arr[0] - 1, h = x + 1, ans = INT_MAX;
        while (l <= h)
        {
            int mid = l + (h - l) / 2;
            if (check(arr, n, mid, x))
            {
                ans = mid;
                l = mid + 1;
            }
            else
            {
                h = mid - 1;
            }
        }
        cout << ans << endl;
    }
}