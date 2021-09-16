sudo rm -rf out
sudo rm -rf build
sudo rm -rf rawdata
mkdir out
mkdir build

mkdir -p rawdata/demo
mkdir -p rawdata/demo

mkdir -p rawdata/funcA
mkdir -p rawdata/funcA

mkdir -p rawdata/funcB
mkdir -p rawdata/funcB

mkdir -p rawdata/funcC
mkdir -p rawdata/funcC

g++ src/demo.cpp src/funcA.cpp src/funcB.cpp src/funcC.cpp -o build/demo -fprofile-arcs -ftest-coverage

mv demo.gcno rawdata/demo
mv funcA.gcno rawdata/funcA
mv funcB.gcno rawdata/funcB
mv funcC.gcno rawdata/funcC

./build/demo

mv demo.gcda rawdata/demo
mv funcA.gcda rawdata/funcA
mv funcB.gcda rawdata/funcB
mv funcC.gcda rawdata/funcC

sudo lcov -c -d ./rawdata/demo -o out/demo.info
sudo lcov -c -d ./rawdata/funcA -o out/funcA.info
sudo lcov -c -d ./rawdata/funcB -o out/funcB.info
sudo lcov -c -d ./rawdata/funcC -o out/funcC.info

# 合并多个 xxx.info信息
lcov -a out/demo.info -a out/funcA.info -a out/funcB.info -a out/funcC.info -o out/merge.info
# 移除不需要生成覆盖率的文件
lcov --remove out/merge.info '*/src/funcC.cpp*' -o out/merge.info
# 将 xxx.info生成报告
sudo genhtml -o out/html out/merge.info --legend --title "demo"

# -d 项目路径，即.gcda .gcno所在的路径
# -a 合并（归并）多个lcov生成的info文件
# -c 捕获，也即收集代码运行后所产生的统计计数信息
# --external 捕获其它目录产生的统计计数文件
# -i/--initial 初始化所有的覆盖率信息，作为基准数据
# -o 生成处理后的文件
# -r/--remove 移除不需要关注的覆盖率信息文件
# -z 重置所有执行程序所产生的统计信息为0
