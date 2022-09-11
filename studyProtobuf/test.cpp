#include "family.pb.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/io/zero_copy_stream_impl.h>
#include <google/protobuf/text_format.h>
 
using namespace std;
using google::protobuf::io::FileInputStream;
using google::protobuf::io::FileOutputStream;
 
int main()
{
    // 写入
    Family  family;
    Person* person;
    const char * filename="../prototxt/test.prototxt";
 
    int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0777);
    FileOutputStream * output = new FileOutputStream(fd);
 
    person = family.add_person();
    person->set_age(25);
    person->set_name("John");
 
    person = family.add_person();
    person->set_age(40);
    person->set_name("Tony");
 
    int size = family.person_size();
    printf("写入: \n");
    printf("size : %d \r\n", size);
    for(int i = 0; i < size; i++)
    {
        Person psn = family.person(i);
        cout <<"Name :" << psn.name() << ", age: " << psn.age() << endl;
    }
 
    google::protobuf::TextFormat::Print(family, output);
    delete output;
    close(fd);

    // 读取
    printf("读出: \n");
    fd = open(filename, O_RDONLY);
    FileInputStream * input = new FileInputStream(fd);
    
    bool success = google::protobuf::TextFormat::Parse(input, &family);
    
    size = family.person_size();

    printf("size : %d \r\n", size);
    for(int i = 0; i<size; i++)
    {
        Person psn = family.person(i);
        cout << "Name :" << psn.name() << ", age: " << psn.age() << endl;
    }

    delete input;
    close(fd);

  return 0;
}