import os
import subprocess

images = ['dog10.bmp', 'dog100.bmp', 'dog500.bmp', 'img_test.bmp', 'city.bmp', 'test.bmp']

if os.path.isfile('/opt/arm/4.3.2/bin/qemu-arm'):
    path = '/opt/arm/4.3.2/bin/qemu-arm '
else:
    path = ''

print "Compiling Unoptimized"
os.chdir('unoptimized')
if (os.path.isfile('/opt/arm/4.3.2/bin/arm-linux-gcc')):
    os.system('/opt/arm/4.3.2/bin/arm-linux-gcc -pg --static -o image image.c')
else:
    os.system('gcc -pg --static -o image image.c')

print "Compiling Optimized"
os.chdir('../optimized')
if (os.path.isfile('/opt/arm/4.3.2/bin/arm-linux-gcc')):
    os.system('/opt/arm/4.3.2/bin/arm-linux-gcc -pg --static -o image image.c')
else:
    os.system('gcc -pg --static -o image image.c')

print "Compiling Assembly Optimized"
os.chdir('../assembly')
if (os.path.isfile('/opt/arm/4.3.2/bin/arm-linux-gcc')):
    os.system('/opt/arm/4.3.2/bin/arm-linux-gcc -pg --static -O3 -o image image.c')
else:
    os.system('gcc -pg --static -o image image.c')

for image in images:
    print '=============================' + image + '============================='
    os.chdir('../unoptimized')
    print "Unoptimized " + image
    os.system('time ' +  path + './image ' + image)
    print

    os.chdir('../optimized')
    print "Optimized " + image
    os.system('time ' +  path + './image ' + image)
    print

    os.chdir('../assembly')
    print "Assembly " + image
    os.system('time ' +  path + './image ' + image)
    print
