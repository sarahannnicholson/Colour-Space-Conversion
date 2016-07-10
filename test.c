
#include <stdio.h>
#include <stdlib.h>

long int convert(int r, int g, int b){
	return 0;
}


int main (void)
{
  	FILE * pFile;
  	long lSize;
  	char * buffer;
  	size_t result;	
	
  	pFile = fopen ( "TuxSmall.bmp" , "rb" );
  	if (pFile==NULL) {
		printf("File error");
		exit (1);
	}
	
	long headerSize = 54;
	// allocate memory to contain the header:
  	buffer = (char*) malloc (sizeof(char)*headerSize);
  	if (buffer == NULL) {
		printf("Memory error"); 
		exit (2);
	}

  	// copy the file into the buffer:
  	result = fread (buffer,1,headerSize,pFile);
  	if (result != headerSize) {
		printf ("Reading error");
		exit (3);
	}

	short int bfReserved1 = (short int)buffer[6];
	short int bfReserved2 = (short int)buffer[8];
	int bfOffBits = (int)buffer[10];
	printf("Pixel data starts at %d\n", bfOffBits);

	if(bfReserved1 || bfReserved1){
		printf("Invalid bitmap");
		exit(3);
	}

	int biWidth = (int)buffer[18];
	int biHeight = (int)buffer[22];
	
	printf("Image is %d x %d \n", biWidth, biHeight);
	
	int rowWidth = biWidth*3;
	int row = 0;
	int offset = bfOffBits;
	int i,j;
	
	int R,G,B;

	free(buffer);
	buffer = (char*) malloc (sizeof(char)*rowWidth);

	for(j=0;j < biHeight; j++){
		printf("========== Row %d ==========\n", j);
		result = fread (buffer,1,rowWidth,pFile);
  		if (result != rowWidth) {
			printf ("Reading error");
			exit (3);
		}
		offset += rowWidth;
		for(i = 0; i< rowWidth; i = i+3){
			R = buffer[i];
			G = buffer[i+1];
			B = buffer[i+2];
			printf("[%d,%d](%d, %d, %d)\n", i, j, R, G, B);
			convert(R,G,B);
		}		
	}
  	// terminate
  	fclose (pFile);
  	free (buffer);
        return 0;
}

