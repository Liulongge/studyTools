rm -rf build
mkdir build
cd build

# 生成构建系统（指定 Ninja 生成器）
cmake -G Ninja ..

# 执行构建（自动并行编译）
ninja

# 运行程序
./hello_ninja