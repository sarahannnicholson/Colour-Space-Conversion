
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
  float y;
  float cb;
  float cr;
} ycc_pixel;

typedef struct ycc_meta {
  float y1;
  float y2;
  float y3;
  float y4;
  float cb;
  float cr;
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

print_rgb_pixel(rgb_pixel* pixel, FILE* out){
  //printf("%d %d %d\n", pixel->r, pixel->g, pixel->b);
  fwrite(&pixel->r, sizeof(uint8_t), 1, out);
  fwrite(&pixel->g, sizeof(uint8_t), 1, out);
  fwrite(&pixel->b, sizeof(uint8_t), 1, out);
}

ycc_pixel convert_to_ycc(rgb_pixel *in){
  ycc_pixel *out = malloc(sizeof(struct ycc_pixel));
  double conversion[3][3] = {65.481, 128.553, 24.966,-37.797, -74.203, 112.0,112.0, -93.786, -18.214};
  double in_array[3] = {((double)in->r)/255, ((double)in->g)/255, ((double)in->b)/255};

  out->y  = 16 +  (conversion[0][0]*in_array[0] + conversion[0][1]*in_array[1] + conversion[0][2]*in_array[2]);
  out->cb = 128 + (conversion[1][0]*in_array[0] + conversion[1][1]*in_array[1] + conversion[1][2]*in_array[2]);
  out->cr = 128 + (conversion[2][0]*in_array[0] + conversion[2][1]*in_array[1] + conversion[2][2]*in_array[2]);

  return *out;
}

ycc_meta downsample_ycc(ycc_pixel *in1, ycc_pixel *in2, ycc_pixel *in3, ycc_pixel *in4){
  ycc_meta *out = malloc(sizeof(struct ycc_meta));
  out->y1  = in1->y;
  out->y2  = in2->y;
  out->y3  = in3->y;
  out->y4  = in4->y;
  out->cb = (in1->cb + in2->cb + in3->cb + in4->cb)/4;
  out->cr = (in1->cr + in2->cr + in3->cr + in4->cr)/4;
  return *out;
}

ycc_array upsample_ycc(ycc_meta* in){
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

  return *out;
}

int clip(float in){
  if(in > 255){
    return 255;
  } else if (in < 0) {
    return 0;
  } else {
    return (uint8_t)in;
  }
}

rgb_pixel convert_to_rgb(ycc_pixel *in){
  rgb_pixel *out = malloc(sizeof(struct rgb_pixel));

  out->r =  clip(1.164*(in->y -16) + 1.596*(in->cr - 128));
  out->g =  clip((1.164*(in->y -16) - 0.813*(in->cr - 128) - 0.391*(in->cb - 128)));
  out->b =  clip((1.164*(in->y -16) + 2.018*(in->cb - 128)));


  return *out;
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
      yccData->data[offset+i] = convert_to_ycc(&inData->data[offset+i]);
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
      yccMetaData->data[offset+i] = downsample_ycc(&inData->data[tracer], &inData->data[tracer+1], &inData->data[tracer+width], &inData->data[tracer+1+width]);
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
      ycc_array ycca = upsample_ycc(&inData->data[offset+i]);
      yccData->data[tracer] = ycca.p1;
      yccData->data[tracer+1] = ycca.p2;
      yccData->data[tracer+width] = ycca.p3;
      yccData->data[tracer+1+width] = ycca.p4;
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
      rgbData->data[offset+i] = convert_to_rgb(&inData->data[offset+i]);
    }
  }
  return rgbData;
}

rgb_data* rgb_to_ycc_to_rgb(rgb_data* inData, int height, int width){
    ycc_data* yccIn         = rgb_to_ycc(inData, height, width);
    ycc_meta_data* yccMeta  = ycc_to_meta(yccIn, height, width);
    ycc_data* yccOut        = meta_to_ycc(yccMeta, height, width);
    return ycc_to_rgb(yccOut, height, width);
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


  fclose(outFile);
  fclose (pFile);
  return 0;
}
