/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Last modified : December 2014
 License       : Released under the GNU GPL 3.0
 Description   : 
 To build use  : nvcc hello.cu -o hello -arch=sm_20
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello()
{
   printf("Hello world\n");
}

// CHANGE: Initial main
// int main()
// {
//   hello<<<1,10>>>();
//   cudaThreadSynchronize();
//   return 0;
// }

// CHANGE: Running hello with 2 blocks of 1024 threads
// int main()
// {
//   hello<<<2,1024>>>();
//   cudaThreadSynchronize();
//   return 0;
// }


//CHANGE: Running hello with 1 block of 2048 threads
int main()
{
  hello<<<1,2048>>>();
  cudaThreadSynchronize();
  return 0;
}
