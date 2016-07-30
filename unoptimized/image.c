
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

rgb_pixel* rgb_pixel_init(char* buffer, int offset){
  rgb_pixel *pixel = (rgb_pixel*)malloc(sizeof(struct rgb_pixel));
  pixel->r = buffer[0+offset];
  pixel->g = buffer[1+offset];
  pixel->b = buffer[2+offset];
  return pixel;
}

ycc_pixel* convert_to_ycc(rgb_pixel *in){
  ycc_pixel *out = malloc(sizeof(struct ycc_pixel));
  double conversion[3][3] = {65.481, 128.553, 24.966,-37.797, -74.203, 112.0,112.0, -93.786, -18.214};
  double in_array[3] = {((double)in->r)/255, ((double)in->g)/255, ((double)in->b)/255};

  out->y  = 16 +  (conversion[0][0]*in_array[0] + conversion[0][1]*in_array[1] + conversion[0][2]*in_array[2]);
  out->cb = 128 + (conversion[1][0]*in_array[0] + conversion[1][1]*in_array[1] + conversion[1][2]*in_array[2]);
  out->cr = 128 + (conversion[2][0]*in_array[0] + conversion[2][1]*in_array[1] + conversion[2][2]*in_array[2]);

  return out;
}

ycc_meta* downsample_ycc(ycc_pixel *in1, ycc_pixel *in2, ycc_pixel *in3, ycc_pixel *in4){
  ycc_meta *out = malloc(sizeof(struct ycc_meta));
  out->y1  = in1->y;
  out->y2  = in2->y;
  out->y3  = in3->y;
  out->y4  = in4->y;
  out->cb = (in1->cb + in2->cb + in3->cb + in4->cb)/4;
  out->cr = (in1->cr + in2->cr + in3->cr + in4->cr)/4;
  return out;
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

int clip(float in){
  if(in > 255){
    return 255;
  } else if (in < 0) {
    return 0;
  } else {
    return (uint8_t)in;
  }
}

rgb_array* convert_to_rgb(ycc_array *in){
  rgb_array *out = malloc(sizeof(struct rgb_array));

  out->p1.r =  clip(1.164*(in->p1.y -16) + 1.596*(in->p1.cr - 128));
  out->p1.g =  clip((1.164*(in->p1.y -16) - 0.813*(in->p1.cr - 128) - 0.391*(in->p1.cb - 128)));
  out->p1.b =  clip((1.164*(in->p1.y -16) + 2.018*(in->p1.cb - 128)));

  out->p2.r =  clip(1.164*(in->p2.y -16) + 1.596*(in->p2.cr - 128));
  out->p2.g =  clip((1.164*(in->p2.y -16) - 0.813*(in->p2.cr - 128) - 0.391*(in->p2.cb - 128)));
  out->p2.b =  clip((1.164*(in->p2.y -16) + 2.018*(in->p2.cb - 128)));

  out->p3.r =  clip(1.164*(in->p1.y -16) + 1.596*(in->p1.cr - 128));
  out->p3.g =  clip((1.164*(in->p1.y -16) - 0.813*(in->p1.cr - 128) - 0.391*(in->p1.cb - 128)));
  out->p3.b =  clip((1.164*(in->p1.y -16) + 2.018*(in->p1.cb - 128)));

  out->p4.r =  clip(1.164*(in->p1.y -16) + 1.596*(in->p1.cr - 128));
  out->p4.g =  clip((1.164*(in->p1.y -16) - 0.813*(in->p1.cr - 128) - 0.391*(in->p1.cb - 128)));
  out->p4.b =  clip((1.164*(in->p1.y -16) + 2.018*(in->p1.cb - 128)));

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

  rgb_array pixelLine[rowWidth/2];
  printf("Pixel line is %d long\n", rowWidth/6);

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
      //printf("YCC: (%f, %f, %f)\n", ycc1->y, ycc1->cb, ycc1->cr);
      ycc_pixel *ycc2 = convert_to_ycc(in2);
      //printf("YCC: (%f, %f, %f)\n", ycc2->y, ycc2->cb, ycc2->cr);
      ycc_pixel *ycc3 = convert_to_ycc(in3);
      //printf("YCC: (%f, %f, %f)\n", ycc3->y, ycc3->cb, ycc3->cr);
      ycc_pixel *ycc4 = convert_to_ycc(in4);
      //printf("YCC: (%f, %f, %f)\n", ycc4->y, ycc4->cb, ycc4->cr);

      ycc_meta *yccd = downsample_ycc(ycc1, ycc2, ycc3, ycc4);
      //printf("Downsampled YCC: (%f, %f, %f, %f, %f, %f)\n", yccd->y1, yccd->y2, yccd->y3, yccd->y4, yccd->cb, yccd->cr);

      ycc_array *ycca = upsample_ycc(yccd);
      //printf("Upsampled YCC: (%f, %f, %f)\n", ycca->p1.y, ycca->p1.cb, ycca->p1.cr);
      //printf("Upsampled YCC: (%f, %f, %f)\n", ycca->p2.y, ycca->p2.cb, ycca->p2.cr);
      //printf("Upsampled YCC: (%f, %f, %f)\n", ycca->p3.y, ycca->p3.cb, ycca->p3.cr);
      //printf("Upsampled YCC: (%f, %f, %f)\n", ycca->p4.y, ycca->p4.cb, ycca->p4.cr);

      rgb_array *out = convert_to_rgb(ycca);
      //printf("Downsampled RGB: (%d, %d, %d)\n", out->p1.r, out->p1.g, out->p1.b);
      //printf("Downsampled RGB: (%d, %d, %d)\n", out->p2.r, out->p2.g, out->p2.b);
      //printf("Downsampled RGB: (%d, %d, %d)\n", out->p3.r, out->p3.g, out->p3.b);
      //printf("Downsampled RGB: (%d, %d, %d)\n", out->p4.r, out->p4.g, out->p4.b);

      pixelLine[i/6] = *out;

      free(in1);
      free(in2);
      free(in3);
      free(in4);
      free(ycc1);
      free(ycc2);
      free(ycc3);
      free(ycc4);
      free(yccd);
      free(ycca);
		}
    int k;
    for(k = 0; k < rowWidth/6; k ++){
      //printf("%d %d\n", k, j);
      print_rgb_pixel(&pixelLine[k].p1, outFile);
      //printf("%d %d\n", k+1, j);
      print_rgb_pixel(&pixelLine[k].p2, outFile);
    }
    for(k = 0; k < rowWidth/6; k ++){
      //printf("%d %d\n", k, j+1);
      print_rgb_pixel(&pixelLine[k].p3, outFile);
      //printf("%d %d\n", k+1, j+1);
      print_rgb_pixel(&pixelLine[k].p4, outFile);
    }
	}
  fclose (pFile);
  fclose(outFile);
  return 0;
}
