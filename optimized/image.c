
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#define FP_SCALE 4096
#define FP_SHIFT 12

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

print_bmp_header(bmp_header* header, FILE* out){
  header->biWidth = header->biWidth / 2;
  header->biHeight = header->biHeight / 2;
  header->bfSize = header->bfSize / 4;

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

  header->biWidth = header->biWidth * 2;
  header->biHeight= header->biHeight * 2;
  header->bfSize = header->bfSize * 4;
}

print_rgb_pixel(rgb_pixel* pixel, FILE* out){
  fwrite(&pixel->r, sizeof(uint8_t), 1, out);
  fwrite(&pixel->g, sizeof(uint8_t), 1, out);
  fwrite(&pixel->b, sizeof(uint8_t), 1, out);
}

rgb_pixel* rgb_pixel_init(char* buffer, int offset){
  rgb_pixel *pixel = (rgb_pixel*)malloc(sizeof(struct rgb_pixel));
  pixel->r = buffer[0+offset];
  pixel->g = buffer[1+offset];
  pixel->b = buffer[2+offset];
  return pixel;
}

ycc_pixel* convert_to_ycc(rgb_pixel *in){
  ycc_pixel *out = malloc(sizeof(struct ycc_pixel));
  int conversion[3][3] = {65.481*FP_SCALE, 128.553*FP_SCALE, 24.966*FP_SCALE, -37.797*FP_SCALE, -74.203*FP_SCALE, 112.0*FP_SCALE,112.0*FP_SCALE, -93.786*FP_SCALE, -18.214*FP_SCALE};

  out->y  = 16 +  (conversion[0][0]*in->r + conversion[0][1]*in->g + conversion[0][2]*in->b)/FP_SCALE/255;
  out->cb = 128 + (conversion[1][0]*in->r + conversion[1][1]*in->g + conversion[1][2]*in->b)/FP_SCALE/255;
  out->cr = 128 + (conversion[2][0]*in->r + conversion[2][1]*in->g + conversion[2][2]*in->b)/FP_SCALE/255;

  return out;
}

ycc_pixel* downsample_ycc(ycc_pixel *in1, ycc_pixel *in2, ycc_pixel *in3, ycc_pixel *in4){
  ycc_pixel *out = malloc(sizeof(struct ycc_pixel));
  out->y  = (in1->y + in2->y + in3->y + in4->y) >> 2;
  out->cb = (in1->cb + in2->cb + in3->cb + in4->cb) >> 2;
  out->cr = (in1->cr + in2->cr + in3->cr + in4->cr) >> 2;
  return out;
}

rgb_pixel* convert_to_rgb(ycc_pixel *in){
  rgb_pixel *out = malloc(sizeof(struct rgb_pixel));
  out->r = 2 + ((int)(1.164*FP_SCALE*(in->y -16) + 1.596*FP_SCALE*(in->cr - 128)) >> FP_SHIFT);
  out->g = 1 + ((int)(1.164*FP_SCALE*(in->y -16) - 0.813*FP_SCALE*(in->cr - 128) - 0.391*FP_SCALE*(in->cb - 128)) >> FP_SHIFT);
  out->b = 2 + ((int)(1.164*FP_SCALE*(in->y -16) + 2.018*FP_SCALE*(in->cb - 128)) >> FP_SHIFT);

  return out;
}

int main (int argc, char *argv[])
{
  	FILE * pFile;
    FILE * outFile;
    size_t result;

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
  print_bmp_header(header, outFile);
  fseek (outFile, header->bfOffBits, SEEK_SET);
  fseek (pFile, header->bfOffBits, SEEK_SET);

	int rowWidth = header->biWidth*3;
	int row = 0;
	int i,j;

  printf("Row Width is %d\n", rowWidth);

  char* line1;
  char* line2;
	line1 = (char*) malloc (sizeof(char)*rowWidth);
  line2 = (char*) malloc (sizeof(char)*rowWidth);
	for(j=0;j < header->biHeight; j=j+2){
		result = fread (line1,1,rowWidth,pFile);
  		if (result != rowWidth) {
			printf ("Reading error, line2 %d", j);
			exit (3);
		}
    result = fread (line2,1,rowWidth,pFile);
  		if (result != rowWidth) {
			printf ("Reading error, line2 %d", j);
			exit (3);
		}
		for(i = 0; i < rowWidth; i = i+6){
			rgb_pixel *in1 = rgb_pixel_init(line1, i);
      //printf("RGB: (%d, %d, %d)\n", in1->r, in1->g, in1->b);
      rgb_pixel *in2 = rgb_pixel_init(line1, i+3);
      //printf("RGB: (%d, %d, %d)\n", in2->r, in2->g, in2->b);
      rgb_pixel *in3 = rgb_pixel_init(line2, i);
      //printf("RGB: (%d, %d, %d)\n", in3->r, in3->g, in3->b);
      rgb_pixel *in4 = rgb_pixel_init(line2, i+3);
      //printf("RGB: (%d, %d, %d)\n", in4->r, in4->g, in4->b);

      ycc_pixel *ycc1 = convert_to_ycc(in1);
      //printf("YCC: (%d, %d, %d)\n", ycc1->y, ycc1->cb, ycc1->cr);
      ycc_pixel *ycc2 = convert_to_ycc(in2);
      //printf("YCC: (%d, %d, %d)\n", ycc2->y, ycc2->cb, ycc2->cr);
      ycc_pixel *ycc3 = convert_to_ycc(in3);
      //printf("YCC: (%d, %d, %d)\n", ycc3->y, ycc3->cb, ycc3->cr);
      ycc_pixel *ycc4 = convert_to_ycc(in4);
      //printf("YCC: (%d, %d, %d)\n", ycc4->y, ycc4->cb, ycc4->cr);

      ycc_pixel *yccd = downsample_ycc(ycc1, ycc2, ycc3, ycc4);
      //printf("Downsampled YCC: (%d, %d, %d)\n", yccd->y, yccd->cb, yccd->cr);

      rgb_pixel *out = convert_to_rgb(yccd);
      //printf("Downsampled RGB: (%d, %d, %d)\n", out->r, out->g, out->b);
      print_rgb_pixel(out, outFile);

      free(in1);
      free(in2);
      free(in3);
      free(in4);
      free(ycc1);
      free(ycc2);
      free(ycc3);
      free(ycc4);
      free(yccd);
      free(out);
		}
	}
  fclose (pFile);
  fclose(outFile);
  return 0;
}
