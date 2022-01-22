# GCC 编译器源码编译安装到指定目录

## 1.源码下载
    下载地址: http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/
    此处下载11.2.0版本

## 2.编译
    1.解压
        $ tar -xvf gcc-11.2.0.tar.gz
    2.下载依赖包
        $ cd gcc-11.2.0
        $ ./contrib/download_prerequisites
    3.编译并安装到指定目录
        $ cd ../
        $ mkdir build
        $ cd build
        $ $pwd/../gcc-11.2.0/configure --prefix=/root/workspace/studyTools/gccCompiler/build/GCC-11.2.0 --enable-languages=c,c++,fortran,go --disable-multilib
        $ make -j8 （此过程时间较长，几十分钟不等）
        $ make install
    4.安装内容拷贝
    5.编译器使用
        1.声明环境变量
        $ export PATH=/root/workspace/studyTools/gccCompiler/GCC-11.2.0/bin:$PATH
        $ export LD_LIBRARY_PATH=/root/workspace/studyTools/gccCompiler/GCC-11.2.0/lib:$LD_LIBRARY_PATH
        $ export LD_LIBRARY_PATH=/root/workspace/studyTools/gccCompiler/GCC-11.2.0/lib64:$LD_LIBRARY_PATH
    6.验证
        查看生成二进制文件编译器版本
        $ strings -a [binary_name] | grep -i gcc



