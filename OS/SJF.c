#include <stdio.h>
int main()
{
    int i, j, n = 3, time, sum_wait = 0, sum_turnaround = 0, smallest;
    int at[3] = {0, 2, 4}, bt[3] = {5, 3, 7}, rt[3] = {0, 0, 0}, remain; // rt = remaining Time
    remain = n;
    for (i = 0; i < n; i++)
    {
        rt[i] = bt[i];
    }
    // bt[3]=9999;
    printf("\n\nProcess\t| waiting time\t| turnaround time\n");
    for (time = 0; remain != 0; time++)
    {
        smallest = 2;
        for (i = 0; i < n; i++)
        {
            if (at[i] <= time && bt[i] < bt[smallest] && rt[i] > 0)
            {
                smallest = i;
            }
        }
        rt[smallest]--;
        if (rt[smallest] == 0)
        {
            remain--;
            printf("P[%d]\t|\t%d\t|\t%d\n", smallest + 1, time + 1 - at[smallest] - bt[smallest], time + 1 - at[smallest]);
            sum_wait += time + 1 - at[smallest] - bt[smallest];
            sum_turnaround += time + 1 - at[smallest];
        }
    }
    printf("\nAvg waiting time = %f\n", sum_wait * 1.0 / n);
    printf("Avg turnaround time = %f\n", sum_turnaround * 1.0 / n);
    return 0;
}