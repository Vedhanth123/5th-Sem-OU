#include <stdio.h>
#include <stdlib.h>

int Queue[10], left = -1, right = -1;

void enque(int data);
int deque();
int isEmpty();

void enque(int data) {
    if(right == 10)
        printf("Queue is full");
    else
        Queue[++right] = data;
}

int deque() {
    if(left == -1)
        printf("Queue is empty");
    else
        return Queue[left++];
}

int isEmpty() {
    if(left == -1 && -1 == right)
        return 1;
    else
        return 0;
}

void main() {

    int bt[3] = {6,10,3};
    int timeslice = 3;
    int arrivaltime[3] = {0,2,7};
    int wt[4] = {0,0,0,0};
    int bt[4] = {0,0,0,0};

    
    int t = 0;

    while(!isEmpty()) {
        if(t % timeslice == 0 && t != 0) {
            
        }
    }
}