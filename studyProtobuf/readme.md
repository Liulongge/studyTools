# protobuf 使用

## 库编译
    下载 protobuf库 https://github.com/protocolbuffers/protobuf
``` bash
$ cd protobuf-21.5
$ mkdir build
$ cd build
$ cmake ../
$ make -j8
```
    生成protobuf-21.5/build/libprotobuf.a静态库文件

## 定义*.proto文件
```proto
syntax = "proto2";
 
message Person {
  required int32 age = 1;
  required string name = 2;
}
 
message Family {
  repeated Person person = 1;
}
```

## 生成c++相关*.pb.cc, *.pb.h文件
``` bash
$ ./protoc ./*.proto --cpp_out=./
# *.proto: protobuf源文件
# --cpp_out: 生成*pb.cc, *pb.h路径
```

## 编译源文件
``` bash
$ ./release.sh
```

## 运行
    生成*.prototxt内容如下：
    person {
        age: 25
        name: "John"
    }
    person {
        age: 40
        name: "Tony"
    }

## 参考
[PROTOBUF介绍及简单使用](https://www.freesion.com/article/8179689487/)

[PROTOBUF介绍及简单使用(下）之文件读写](https://www.freesion.com/article/6658661335/)


