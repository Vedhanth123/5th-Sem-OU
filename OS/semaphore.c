#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
int data=0,rdcnt=0;
sem_t mutex,writeblock;
void * reader(void * no)
{
    printf("\n\tReader %d is executing ",(int)no);
    sem_wait(&mutex);
    printf("\n\tWait  to mutex by %d reader",(int)no);
    rdcnt++;
    if(rdcnt==1)
    {
        sem_wait(&writeblock);
        printf("\n\tWait  to writerblock by %d reader",(int)no);
    }
    printf("\n\t***Reader %d read data = %d ",(int)no,data);
    if(rdcnt==1)
    {
        sem_post(&writeblock);
        printf("\n\tSignal to writerblock by %d reader",(int)no);
    }
    sem_post(&mutex);
    printf("\n\tSignal to mutex by %d reader\n",(int)no);
}
void * writer(void * no)
{
    printf("\n\tWriter %d is executing ",(int)no);
    sem_wait(&writeblock);
    printf("\n\tWait  to writerblock by %d writer",(int)no);
    data+=5;
    printf("\n\t***Writer %d write data = %d ",(int)no,data);
    sem_post(&writeblock);
    printf("\n\tSignal to writer by %d writer\n",(int)no);
}
int main()
{
    int no=4,i,ir=0,iw=0,ch;
    sem_init(&mutex,0,1);
    sem_init(&writeblock,0,1); 
    pthread_t r[no],w[no];    
    ch = 1;
    
    do
    {
        switch(ch)
        {
            case 1: pthread_create(&r[ir],NULL,reader,(void *)ir);
                    pthread_join(r[ir++],NULL);
                    ch += 1;
                    break;
            case 2: pthread_create(&w[iw],NULL,writer,(void *)iw);
                    pthread_join(w[iw++],NULL);
                    ch += 1;
                    break;
        }
    }while(ch!=3);
    
    sem_destroy(&mutex);
    sem_destroy(&writeblock);
}