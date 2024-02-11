#include <stdio.h>
#include <stdlib.h>

const int INIT_CAP = 10;

void nomem_error()
{
  fprintf( stderr, "Fatalis hiba: nincs memoria\n");
  exit(1);
}
void print_reverse( double *stack, int size)
{
  while ( --size >= 0 )  /* stack[size-1] ... stack[0] */
  {
    printf( "%f\n", stack[size]);
  }	  
}
/* megduplázzuk a buffert, és átírjuk a kapacitást */
void grow( double **pdp, int *pcap)
{
  double *pnew = 
          (double *)realloc(*pdp, *pcap*2*sizeof(double));	
  if ( NULL == pnew ) 
    /* noreturn */ nomem_error(); 
  *pdp  = pnew; /* visszaírjuk az új pointert */
  *pcap *= 2;   /* update-eljük a kapacitást  */
}
int main()
{
  double  d;
  int     cap   = INIT_CAP;  /* a buffer mérete */	
  int     size  = 0;         /* beszúrt elemek száma */
  double *stack = (double *)malloc(cap * sizeof(double));
  if ( NULL == stack )
    /* noreturn */ nomem_error(); 

  while ( 1 == scanf("%lf", &d) )  
  {
    if ( size == cap )  /* betelt a buffer */
    {
      grow( &stack, &cap);  /* megnöveljük a buffert */	    
    }	    
    stack[size++] = d;
  }
  printf("==== eredmeny ====\n");	
  print_reverse( stack, size );  /* elemek kiírása */
  return 0;
}
