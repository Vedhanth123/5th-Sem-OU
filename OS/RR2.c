#include <stdio.h>
int main()
{
  int i, j, n=4, time, remain, flag = 0, ts = 1;
  int sum_wait = 0, sum_turnaround = 0, arrival_time[4]={0,0,0,0}, burst_time[4]={6,3,1,7}, remaining_time[4];

  remain = n;
  for (i = 0; i < n; i++)
  {
    remaining_time[i] = burst_time[i];
  }
  printf("\n\nProcess\t|Turnaround time|waiting time\n\n");
  for (time = 0, i = 0; remain != 0;)
  {
    if (remaining_time[i] <= ts && remaining_time[i] > 0)
    {
      time += remaining_time[i];
      remaining_time[i] = 0;
      flag = 1;
    }
    else if (remaining_time[i] > 0)
    {
      remaining_time[i] -= ts;
      time += ts;
    }
    if (remaining_time[i] == 0 && flag == 1)
    {
      remain--;
      printf("P[%d]\t|\t%d\t|\t%d\n", i + 1, time - arrival_time[i], time - arrival_time[i] - burst_time[i]);
      sum_wait += time - arrival_time[i] - burst_time[i];
      sum_turnaround += time - arrival_time[i];
      flag = 0;
    }
    if (i == n - 1)
      i = 0;
    else if (arrival_time[i + 1] <= time)
      i++;
    else
      i = 0;
  }
  printf("\nAvg sum_wait = %f\n", sum_wait * 1.0 / n);
  printf("Avg sum_turnaround = %f\n", sum_turnaround * 1.0 / n);
  return 0;
}