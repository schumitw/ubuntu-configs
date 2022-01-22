#!/bin/bash  
  
echo "Listing Android files ($PWD) ..."  
    
find "$PWD/bionic"                                                          \
"$PWD/bootable"                                                             \
"$PWD/build"                                                                \
"$PWD/cts"																	\
"$PWD/dalvik"                                                               \
"$PWD/development"                                                          \
"$PWD/device"                                                               \
"$PWD/external"                                                             \
"$PWD/frameworks"                                                           \
"$PWD/hardware"                                                             \
"$PWD/libcore"                                                              \
"$PWD/ndk"	                                                                \
"$PWD/packages"                                                             \
"$PWD/sdk"	                                                                \
"$PWD/system"                                                               \
-name '*.java' -print -o                                               \
-name '*.aidl' -print -o                                               \
-name '*.hpp' -print -o                                                \
-name '*.cpp'  -print -o                                               \
-name '*.xml'  -print -o                                               \
-name '*.mk'  -print -o                                                \
-name '*.[chxsS]' -print > cscope.files  
	  
if [ "$android_kernel" == "" ];then
	read -p "Please enter your kernel directory name: " android_kernel
fi
if [ -d "$PWD/$android_kernel" ];then
	echo "Listing Kernel files ($PWD/$android_kernel)... "
	find  "$PWD/$android_kernel"                                              \
	-path "$PWD/$android_kernel/arch/*" -prune -o		                     \
	-path "$PWD/$android_kernel/tmp*" -prune -o                               \
	-path "$PWD/$android_kernel/Documentation*" -prune -o                     \
	-path "$PWD/$android_kernel/scripts*" -prune -o				               \
	-name "*.[chxsS]" -print >> cscope.files  
	    
	find "$PWD/$android_kernel/arch/arm/include/"				            \
	"$PWD/$android_kernel/arch/arm/kernel/"							        \
	"$PWD/$android_kernel/arch/arm/common/"                                 \
	"$PWD/$android_kernel/arch/arm/boot/"					               \
	"$PWD/$android_kernel/arch/arm/lib/"							         \
	"$PWD/$android_kernel/arch/arm/mm/"								       \
	"$PWD/$android_kernel/arch/arm/mach-msm/" -name "*.[chxsS]" -print >> cscope.files
else
	echo "Can't find your kernel directory!!"
fi 
		  
echo "Creating cscope DB ..."  
/usr/bin/cscope -b -q -k  
echo "Done"
#ANDROID_DIR=$PWD
#export ANDROID_DIR
