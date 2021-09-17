环境：
gcc
ubuntu

安装lcov:
sudo apt-get install lcov

继承测试环境下使用gcov
由于继承测试，进程在启动之后，在后台运行，是不会主动退出的
xxx.gcda文件在进程退出之后才会转存
因此必须在继承测试执行借宿之后，手动停掉进程、
可以借助信号量signal捕获机制，注册回调函数
在回调函数中调用__gcov_flush()函数，对gcda文件进行强制转存
并使进程安全退出exit(0)

具体步骤如下:
1.运行run.sh，编译并运行进程
2.运行gen.sh，停掉进程并行文件转换