
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

typedef struct ycc_array {
  struct ycc_pixel p1;
  struct ycc_pixel p2;
  struct ycc_pixel p3;
  struct ycc_pixel p4;
} ycc_array;

typedef struct rgb_array {
  struct rgb_pixel p1;
  struct rgb_pixel p2;
  struct rgb_pixel p3;
  struct rgb_pixel p4;
} rgb_array;

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

void print_rgb_pixel(rgb_pixel* pixel, FILE* out){
  fwrite(&pixel->r, sizeof(uint8_t), 1, out);
  fwrite(&pixel->g, sizeof(uint8_t), 1, out);
  fwrite(&pixel->b, sizeof(uint8_t), 1, out);
}

void convert_to_ycc(ycc_pixel *out, rgb_pixel *in){
  out->y  = 16 +  ((int)( 16763*in->r +  32909*in->g +  6391*in->b) >> 16);
  out->cb = 128 + ((int)( -9676*in->r + -18996*in->g + 28672*in->b) >> 16);
  out->cr = 128 + ((int)( 28672*in->r + -24009*in->g + -4662*in->b) >> 16);
  return;
}

void downsample_ycc(ycc_meta* out, ycc_pixel *in1, ycc_pixel *in2, ycc_pixel *in3, ycc_pixel *in4){
  out->y1  = in1->y;
  out->y2  = in2->y;
  out->y3  = in3->y;
  out->y4  = in4->y;
  out->cb = (in1->cb + in2->cb + in3->cb + in4->cb) >> 2;
  out->cr = (in1->cr + in2->cr + in3->cr + in4->cr) >> 2;
  return;
}

ycc_array* upsample_ycc(ycc_meta* in){
  ycc_array *out = malloc(sizeof(struct ycc_array));
  out->p1.y = in->y1;
  out->p2.y = in->y2;
  out->p3.y = in->y3;
  out->p4.y = in->y4;

  out->p1.cb = in->cb;
  out->p2.cb = in->cb;
  out->p3.cb = in->cb;
  out->p4.cb = in->cb;

  out->p1.cr = in->cr;
  out->p2.cr = in->cr;
  out->p3.cr = in->cr;
  out->p4.cr = in->cr;

  return out;
}

void convert_to_rgb(rgb_pixel *out, ycc_pixel *in){

  int r = (298*(in->y -16) + 409*(in->cr - 128)) >> 8;
  int g = ((298*(in->y -16) - 208*(in->cr - 128) - 100*(in->cb - 128))) >> 8;
  int b = ((298*(in->y -16) + 517*(in->cb - 128))) >> 8;
  out->r = r > 255 ? 255 : (r < 0 ? 0 : r);
  out->g = g > 255 ? 255 : (g < 0 ? 0 : g);
  out->b = b > 255 ? 255 : (b < 0 ? 0 : b);

  return;
}

ycc_data* rgb_to_ycc(rgb_data* inData, int height, int width){
  int imageSize = height*width;

  ycc_data* yccData;
  yccData = malloc(sizeof(ycc_data));
  yccData->data = malloc(sizeof(ycc_pixel)*imageSize);

  //Convert Each RGB to YCC
  int i,j;
  for(j = 0; j < height; j = j+1){
    for(i = 0; i < width; i = i+1){
      int offset = j*width;
      convert_to_ycc(&yccData->data[offset+i], &inData->data[offset+i]);
    }
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
  for(j = 0; j < height/2; j++){
    for(i = 0; i < width/2; i++){
      int offset = j*width/2;
      int tracer = j*2*width +i*2;
      downsample_ycc(&yccMetaData->data[offset+i], &inData->data[tracer], &inData->data[tracer+1], &inData->data[tracer+width], &inData->data[tracer+1+width]);
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
  for(j = 0; j < height/2; j++){
    for(i = 0; i < width/2; i++){
      int offset = j*width/2;
      int tracer = j*2*width +i*2;
      ycc_array* ycca = upsample_ycc(&inData->data[offset+i]);
      yccData->data[tracer] = ycca->p1;
      yccData->data[tracer+1] = ycca->p2;
      yccData->data[tracer+width] = ycca->p3;
      yccData->data[tracer+1+width] = ycca->p4;
      free(ycca);
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
  int i,j;
  for(j = 0; j < height; j = j+1){
    for(i = 0; i < width; i = i+1){
      int offset = j*width;
      convert_to_rgb(&rgbData->data[offset+i], &inData->data[offset+i]);
    }
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
  	pFile = fopen ( argv[1] , "rb" );
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
  printf("Offset is %d\n", header->bfOffBits);
  fseek (pFile, header->bfOffBits, SEEK_SET);

  int imageSize = header->biHeight*header->biWidth;
  rgb_data *inData;
  inData = malloc(sizeof(rgb_data));
  inData->data = malloc(sizeof(rgb_pixel)*imageSize);

  printf("%d %d\n", header->biHeight,header->biWidth);
  fread(inData->data,sizeof(rgb_pixel),imageSize,pFile);

  rgb_data *outData;

  outData = rgb_to_ycc_to_rgb(inData, header->biHeight,header->biWidth);

  print_bmp_header(header, outFile);
  fseek (outFile, header->bfOffBits, SEEK_SET);
  int k;
  for(k = 0; k < imageSize; k ++){
    print_rgb_pixel(&outData->data[k], outFile);
  }

  free(outData);


  fclose(outFile);
  fclose (pFile);
  return 0;
}
