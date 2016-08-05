
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>


typedef struct bmp_header {
  //File header
  uint16_t bfType;
  uint32_t bfSize;
  uint16_t bfReserved1;
  uint16_t bfReserved2;
  uint32_t bfOffBits;

  //Image header
  uint32_t biSize;;
  uint32_t biWidth;
  uint32_t biHeight;
  uint16_t biPlanes;
  uint16_t biBitCount;
  uint32_t biCompression;
  uint32_t biSizeImage;
  uint32_t biXPelsPerMeter;
  uint32_t biYPelsPerMeter;
  uint32_t biClrUsed;
  uint32_t biClrImportant;

} bmp_header;

typedef struct rgb_pixel {
  uint8_t r;
  uint8_t g;
  uint8_t b;
} rgb_pixel;

typedef struct ycc_pixel {
  uint8_t y;
  uint8_t cb;
  uint8_t cr;
} ycc_pixel;

typedef struct ycc_meta {
  uint8_t y1;
  uint8_t y2;
  uint8_t y3;
  uint8_t y4;
  uint8_t cb;
  uint8_t cr;
} ycc_meta;

typedef struct rgb_data {
  rgb_pixel* data;
} rgb_data;

typedef struct ycc_data {
  ycc_pixel* data;
} ycc_data;

typedef struct ycc_meta_data {
  ycc_meta* data;
} ycc_meta_data;

bmp_header* bmp_init(FILE* fp){

    bmp_header *header = malloc(sizeof(struct bmp_header));

    fread(&header->bfType, sizeof(uint16_t), 1, fp);
    fread(&header->bfSize, sizeof(uint32_t), 1, fp);
    fread(&header->bfReserved1, sizeof(uint16_t), 1, fp);
    fread(&header->bfReserved2, sizeof(uint16_t), 1, fp);
    fread(&header->bfOffBits, sizeof(uint32_t), 1, fp);

    fread(&header->biSize, sizeof(uint32_t), 1, fp);
    fread(&header->biWidth, sizeof(uint32_t), 1, fp);
    fread(&header->biHeight, sizeof(uint32_t), 1, fp);
    fread(&header->biPlanes, sizeof(uint16_t), 1, fp);
    fread(&header->biBitCount, sizeof(uint16_t), 1, fp);
    fread(&header->biCompression, sizeof(uint32_t), 1, fp);
    fread(&header->biSizeImage, sizeof(uint32_t), 1, fp);
    fread(&header->biXPelsPerMeter, sizeof(uint32_t), 1, fp);
    fread(&header->biYPelsPerMeter, sizeof(uint32_t), 1, fp);
    fread(&header->biClrUsed, sizeof(uint32_t), 1, fp);
    fread(&header->biClrImportant, sizeof(uint32_t), 1, fp);
    return header;
}

void print_bmp_header(bmp_header* header, FILE* out){

  fwrite(&header->bfType, sizeof(uint16_t), 1, out);
  fwrite(&header->bfSize, sizeof(uint32_t), 1, out);
  fwrite(&header->bfReserved1, sizeof(uint16_t), 1, out);
  fwrite(&header->bfReserved2, sizeof(uint16_t), 1, out);
  fwrite(&header->bfOffBits, sizeof(uint32_t), 1, out);

  fwrite(&header->biSize, sizeof(uint32_t), 1, out);
  fwrite(&header->biWidth, sizeof(uint32_t), 1, out);
  fwrite(&header->biHeight, sizeof(uint32_t), 1, out);
  fwrite(&header->biPlanes, sizeof(uint16_t), 1, out);
  fwrite(&header->biBitCount, sizeof(uint16_t), 1, out);
  fwrite(&header->biCompression, sizeof(uint32_t), 1, out);
  fwrite(&header->biSizeImage, sizeof(uint32_t), 1, out);
  fwrite(&header->biXPelsPerMeter, sizeof(uint32_t), 1, out);
  fwrite(&header->biYPelsPerMeter, sizeof(uint32_t), 1, out);
  fwrite(&header->biClrUsed, sizeof(uint32_t), 1, out);
  fwrite(&header->biClrImportant, sizeof(uint32_t), 1, out);

}

ycc_data* rgb_to_ycc(rgb_data* inData, int height, int width){
  int imageSize = height*width;

  ycc_data* yccData;
  yccData = malloc(sizeof(ycc_data));
  yccData->data = malloc(sizeof(ycc_pixel)*imageSize);

  //Convert Each RGB to YCC
  int j;
  for(j = 0; j < imageSize; j+=4){
    //If we have a 32 bit ALU and r,g,b are between 0-255 (2^8)
    //and if addition adds at most 1 bit then each multiplication can use 32 bits
    //then 24 bits remain for maximum percision
    //The max int is 128.553 < 255 (2^8) .: scale factor is 2^16
    yccData->data[j].y  = 16 +  (( 16763*inData->data[j].r +  32909*inData->data[j].g +  6391*inData->data[j].b) >> 16);
    yccData->data[j].cb = 128 + (( -9676*inData->data[j].r + -18996*inData->data[j].g + 28672*inData->data[j].b) >> 16);
    yccData->data[j].cr = 128 + (( 28672*inData->data[j].r + -24009*inData->data[j].g + -4662*inData->data[j].b) >> 16);

    yccData->data[j+1].y  = 16 +  (( 16763*inData->data[j+1].r +  32909*inData->data[j+1].g +  6391*inData->data[j+1].b) >> 16);
    yccData->data[j+1].cb = 128 + (( -9676*inData->data[j+1].r + -18996*inData->data[j+1].g + 28672*inData->data[j+1].b) >> 16);
    yccData->data[j+1].cr = 128 + (( 28672*inData->data[j+1].r + -24009*inData->data[j+1].g + -4662*inData->data[j+1].b) >> 16);

    yccData->data[j+2].y  = 16 +  (( 16763*inData->data[j+2].r +  32909*inData->data[j+2].g +  6391*inData->data[j+2].b) >> 16);
    yccData->data[j+2].cb = 128 + (( -9676*inData->data[j+2].r + -18996*inData->data[j+2].g + 28672*inData->data[j+2].b) >> 16);
    yccData->data[j+2].cr = 128 + (( 28672*inData->data[j+2].r + -24009*inData->data[j+2].g + -4662*inData->data[j+2].b) >> 16);

    yccData->data[j+3].y  = 16 +  (( 16763*inData->data[j+3].r +  32909*inData->data[j+3].g +  6391*inData->data[j+3].b) >> 16);
    yccData->data[j+3].cb = 128 + (( -9676*inData->data[j+3].r + -18996*inData->data[j+3].g + 28672*inData->data[j+3].b) >> 16);
    yccData->data[j+3].cr = 128 + (( 28672*inData->data[j+3].r + -24009*inData->data[j+3].g + -4662*inData->data[j+3].b) >> 16);

  }
  return yccData;
}

ycc_meta_data* ycc_to_meta(ycc_data* inData, int height, int width){
  int imageSize = height*width;

  ycc_meta_data* yccMetaData;
  yccMetaData = malloc(sizeof(ycc_meta_data));
  yccMetaData->data = malloc(sizeof(ycc_meta)*imageSize/4);
  //Convert 2x2 YCC to YCCmeta
  int i,j;
  for(j = 0; j < height >> 1; j++){
    int offset = j*width >> 1;
    for(i = 0; i < width >> 1; i++){
      int tracer = j*2*width +i*2;
      yccMetaData->data[offset+i].y1  = inData->data[tracer].y;
      yccMetaData->data[offset+i].y2  = inData->data[tracer+1].y;
      yccMetaData->data[offset+i].y3  = inData->data[tracer+width].y;
      yccMetaData->data[offset+i].y4  = inData->data[tracer+1+width].y;
      yccMetaData->data[offset+i].cb = (inData->data[tracer].cb + inData->data[tracer+1].cb + inData->data[tracer+width].cb + inData->data[tracer+1+width].cb) >> 2;
      yccMetaData->data[offset+i].cr = (inData->data[tracer].cr + inData->data[tracer+1].cr + inData->data[tracer+width].cr + inData->data[tracer+1+width].cr) >> 2;
    }
  }
  return yccMetaData;
}

ycc_data* meta_to_ycc(ycc_meta_data* inData, int height, int width){
  int imageSize = height*width;

  ycc_data* yccData;
  yccData = malloc(sizeof(ycc_data));
  yccData->data = malloc(sizeof(ycc_pixel)*imageSize);
  //Convert YCCmeta to 2x2 YCC
  int i,j;
  for(j = 0; j < height >> 1; j++){
    int offset = j*width/2;
    for(i = 0; i < width >> 1; i++){
      int tracer = j*2*width +i*2;
      yccData->data[tracer].y = inData->data[offset+i].y1;
      yccData->data[tracer+1].y = inData->data[offset+i].y2;
      yccData->data[tracer+width].y = inData->data[offset+i].y3;
      yccData->data[tracer+1+width].y = inData->data[offset+i].y4;

      yccData->data[tracer].cb = inData->data[offset+i].cb;
      yccData->data[tracer+1].cb = inData->data[offset+i].cb;
      yccData->data[tracer+width].cb = inData->data[offset+i].cb;
      yccData->data[tracer+1+width].cb = inData->data[offset+i].cb;

      yccData->data[tracer].cr = inData->data[offset+i].cr;
      yccData->data[tracer+1].cr = inData->data[offset+i].cr;
      yccData->data[tracer+width].cr = inData->data[offset+i].cr;
      yccData->data[tracer+1+width].cr = inData->data[offset+i].cr;
    }
  }
  return yccData;
}


rgb_data* ycc_to_rgb(ycc_data* inData, int height, int width){
  int imageSize = height*width;

  rgb_data* rgbData;
  rgbData = malloc(sizeof(rgb_data));
  rgbData->data = malloc(sizeof(rgb_pixel)*imageSize);
  //Convery Each YCC to RGB
  int j;
  for(j = 0; j < imageSize ; j++){
    //Variable Folding
    int y1 = 4882170*(inData->data[j].y -16);
    //Largest multiplier is 2.018 < 4 2^2 - 2^8 = 32-10 = 22 bits scale
    int r1 = (y1 + 6694109*(inData->data[j].cr - 128)) >> 22;
    int g1 = ((y1 - 3409969*(inData->data[j].cr - 128) - 1639973*(inData->data[j].cb - 128))) >> 22;
    int b1 = (y1 + 8464105*(inData->data[j].cb - 128)) >> 22;

    rgbData->data[j].r = r1 > 255 ? 255 : (r1 < 0 ? 0 : r1);
    rgbData->data[j].g = g1 > 255 ? 255 : (g1 < 0 ? 0 : g1);
    rgbData->data[j].b = b1 > 255 ? 255 : (b1 < 0 ? 0 : b1);

  }
  return rgbData;
}

rgb_data* rgb_to_ycc_to_rgb(rgb_data* inData, int height, int width){
    ycc_data* yccIn         = rgb_to_ycc(inData, height, width);
    free(inData->data);
    ycc_meta_data* yccMeta  = ycc_to_meta(yccIn, height, width);
    free(yccIn->data);
    ycc_data* yccOut        = meta_to_ycc(yccMeta, height, width);
    free(yccMeta->data);
    rgb_data* out           = ycc_to_rgb(yccOut, height, width);
    free(yccOut->data);
    return out;
}

int main (int argc, char *argv[])
{
  	FILE * pFile;
    FILE * outFile;

    chdir("in");
  	pFile = fopen (argv[1] , "rb" );
    chdir("..");

  	if (pFile==NULL) {
		  printf("Input File error");
		  exit (1);
    }
    chdir("out");
    outFile = fopen(argv[1], "wb");
    chdir("..");
    if (outFile==NULL) {
		  printf("Output File error");
		  exit (1);
    }

  bmp_header *header;
	header = bmp_init(pFile);

	if(header->bfReserved1 || header->bfReserved2){
		printf("Invalid bitmap");
		exit(3);
	}

	printf("Image is %d x %d \n", header->biWidth, header->biHeight);
  //printf("Offset is %d\n", header->bfOffBits);
  fseek (pFile, header->bfOffBits, SEEK_SET);

  int imageSize = header->biHeight*header->biWidth;
  rgb_data *inData;
  inData = malloc(sizeof(rgb_data));
  inData->data = malloc(sizeof(rgb_pixel)*imageSize);

  fread(inData->data,sizeof(rgb_pixel),imageSize,pFile);

  rgb_data *outData;

  outData = rgb_to_ycc_to_rgb(inData, header->biHeight,header->biWidth);

  print_bmp_header(header, outFile);
  fseek (outFile, header->bfOffBits, SEEK_SET);
  int k;
  for(k = 0; k < imageSize; k ++){
    fwrite(&outData->data[k], sizeof(rgb_pixel), 1, outFile);
  }

  free(outData);

  fclose(outFile);
  fclose (pFile);
  return 0;
}
