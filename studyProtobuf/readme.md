# protobuf

## 介绍
    Protobuf是由google开发的一套开源序列化协议框架，类似于XML,JSON，采用协议序列化用于数据存储与读取，与XML相比，定义了数据格式更加简单，数据访问接口可以自动化生成，加快了开发者开发速度，最新的版本为proto3已经支持Java,C++, Python, Java Lite, Ruby,JavaScript, Objective-c 以及C#, go，等常用语言．目前很多项目都在使用Protobuf．
[官方链接](https://developers.google.cn/protocol-buffers/)

[官方文档](https://developers.google.cn/protocol-buffers/docs/overview#whynotxml)

## 优势
        既然xml已经使用非常广泛，那么为什么还需要Protocol Buffer?其优势主要有以下几点：
        1. 简单
        2. 比xml要小3到10倍，proto文件被编译成bin二进制文件
        3. 比xml要快20到100倍
        4. 结构更加清晰，不会产生歧义
        5. 生成数据操作类更加容易，编程更加容易上手，访问接口代码基本都是自动生产
    例如定义一个person数据结构，里面包含name和email两个个人信息，xml定义如下
``` XML
<person>
    <name>John Doe</name>
    <email>jdoe@example.com</email>
</person>
```
        而使用protobuf定义时，其txt定义格式如下：
        是不是有点像python中的元组，采用key-value形式．
        # Textual representation of a protocol buffer.
        # This is *not* the binary format used on the wire.
        person {
        name: "John Doe"
        email: "jdoe@example.com"
        }


## 语法
        上述是采用txt格式进行定义的，但是一般protobuf都是使用.proto文件，其语法格式使用Message定义。采用Message定义，person定义如下：
        message Person {
        required string name = 1;
        required string email= 2;
        }

        意思是Person中的第一个字段为name，其数据类型为string，必选项;第二个字段为email，其数据类型为string，必选项。数据结构前加message关键词，意思是定义一个名为Person的数据结构，Message结构里面的每个成员结构格式如下：
        ［rules］[data_type] [data_name] = [number]

    一. rules
        该字段主要是定义该变量的规则，主要有三种规则：
        1. required:该字段变量为必须的，实例中必须包含的字段．如果是在调试模式下编译 libprotobuf，则序列化一个未初始化的message 将导致断言失败。在优化的构建中，将跳过检查并始终写入消息。但是，解析未初始化的消息将始终失败（通过从解析方法返回 false）
        2. optional:该字段是可选的，可以设置也可以不设置该字段．如果未设置可选字段值，则使用默认值。对于简单类型，你可以指定自己的默认值，就像我们在示例中为电话号码类型所做的那样。否则，使用系统默认值：数字类型为0，字符串为空字符串，bools为false。对于嵌入message，默认值始终是消息的 “默认实例” 或 “原型”，其中没有设置任何字段。调用访问器以获取尚未显式设置的optional（或 required）字段的值始终返回该字段的默认值。
        3. repeated:该字段可以重复任意次数(包括零次)。重复值的顺序将保留在 protocol buffer中。可以将repeated字段视为动态大小的数组。

    二. data_type
        Protobuf支持常用的数据类型，支持的数据类型如下表：
![protobuf支持数据类型](./docs/protobuf%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B.png)

    三. data_name
        data name为数据成员名
    四. number
        Protobuf是采用key-value形式，将成员名映射为number，这样就能实现数据的序列化．每个数据字段都有唯一的数值型标识符．这些标识符用于标识字段在消息中的二进制格式，使用中的类型不应该随意改动。需要注意的是，[1-15]内的标识在编码时只占用一个字节，包含标识符和字段类型。[16-2047]之间的标识符占用2个字节。建议为频繁出现的消息元素使用[1-15]间的标识符。如果考虑到以后可能或扩展频繁元素，可以预留一些标识符。number最小为１，最大为229 - 1, ２^{９９}２^{99}or 536,870,911，　其中19000到19999为Protocol内部使用

    五. 注释
        在proto文件中经常需要添加注释对某个字段进行注释，支持C风格的双斜线//单行注释

    六. 保留字段与标识符
        可以使用reserved关键字指定保留字段和保留标识符
        message Foo {
            reserved 2, 15, 9 to 11;
            reserved "foo", "bar";
        }

    七. syntax关键词
        sysntax关键字经常用到proto文件开头用来表明使用的是哪个proto版本
        syntax = "proto2"


    八. 分号
        行与行之间需要加分号，类似C语言。

## api
    一、写BIN文件API
    bool    SerializeToFileDescriptor(int file_descriptor）// 文件描述符的序列化
    bool    SerializePartialToFileDescriptor(int file_descriptor)
    bool    SerializeToOstream(std::ostream * output) // C++ stream序列化API
    bool    SerializePartialToOstream(std::ostream * output)
    二、读BIN文件API
    bool    ParseFromFileDescriptor(int file_descriptor) // 文件描述符的反序列化
    bool    ParsePartialFromFileDescriptor(int file_descriptor)
    bool    ParseFromIstream(std::istream * input) // C++ stream反序列化API
    bool    ParsePartialFromIstream(std::istream * input)
    三、写PROTOTXT文件API
    bool    Print(const Message & message, io::ZeroCopyOutputStream * output) // 序列化prototxt文件
    bool    PrintUnknownFields(const UnknownFieldSet & unknown_fields, io::ZeroCopyOutputStream * output)
    bool    PrintToString(const Message & message, string * output)
    bool    PrintUnknownFieldsToString(const UnknownFieldSet & unknown_fields, string * output) 
    bool    PrintFieldValueToString(const Message & message, const FieldDescriptor * field, int index, string * output)
    四、读PROTOTXT文件API
    bool    Parse(io::ZeroCopyInputStream * input, Message * output) // 反序列化prototxt文件
    bool	ParseFromString(const string & input, Message * output)
    bool	Merge(io::ZeroCopyInputStream * input, Message * output)
    bool	MergeFromString(const string & input, Message * output)
    bool	ParseFieldValueFromString(const string & input, const FieldDescriptor * field, Message * message)

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


