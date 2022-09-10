#  编译生成protobuf.a lib
# cd protobuf-21.5
# rm -rf build
# mkdir build
# cd build
# cmake ../
# make -j8

# 将*.proto 文件转换为*.pb.cc与*.pb.h
cd protoCfg
../protobuf-21.5/build/protoc ./*.proto --cpp_out=../protobufGenFiles/
cd ../

# 编译
rm -rf build/*
cd build
cmake ../
make -j4