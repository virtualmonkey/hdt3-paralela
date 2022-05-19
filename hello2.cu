/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Last modified : December 2014
 License       : Released under the GNU GPL 3.0
 Description   : 
 To build use  : nvcc hello2.cu -o hello2 -arch=sm_20 
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello ()
{
  // CHANGE: uncommented this
  int myID = ( blockIdx.z * gridDim.x * gridDim.y  + 
               blockIdx.y * gridDim.x + 
               blockIdx.x ) * blockDim.x * blockDim.y * blockDim.z + 
               threadIdx.z *  blockDim.x * blockDim.y + 
               threadIdx.y * blockDim.x + 
               threadIdx.x; 


  // int myID = ( blockIdx.z * gridDim.x * gridDim.y  + 
  //              blockIdx.y * gridDim.x + 
  //              blockIdx.x ) * blockDim.x + 
  //              threadIdx.x; 

  // CHANGE: added this conditional to show only if myId is 100,000
  printf ("Hello world from %i\n", myID);
}

int main ()
{
  // dim3 g (4, 3, 2);
  // hello <<< g, 10 >>> ();

  // CHANGE: added this
  // dim3 g (4,2);
  // dim3 b (32,16);
  // hello <<<g, b>>>();

  // CHANGE: configuration for 10,000 threads
  dim3 g (10,10,100);
  hello <<<g, 10>>>();

  cudaThreadSynchronize ();
  return 0;
}
