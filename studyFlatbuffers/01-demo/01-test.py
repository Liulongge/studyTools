import flatbuffers
from generated.Person import Person

# 创建一个新的 FlatBuffer 构建器
builder = flatbuffers.Builder(1024)

# 创建字符串 name
name = "John Doe"
name_offset = builder.CreateString(name)

# 创建字符串数组 hobbies
hobbies = ["reading", "swimming", "coding"]
hobbies_encoded = [h.encode('utf-8') for h in hobbies]
hobbies_offset = builder.CreateByteVector(bytearray(b'\x00'.join(hobbies_encoded)))

# 使用构造函数创建 Person 对象
Person.PersonStart(builder)
Person.PersonAddName(builder, name_offset)
Person.PersonAddAge(builder, 30)
Person.PersonAddHobbies(builder, hobbies_offset)
person_offset = Person.PersonEnd(builder)
builder.Finish(person_offset)

# 获取 FlatBuffer 的字节数组
person_data = builder.Output()

# 反序列化
person = Person.Person.GetRootAsPerson(person_data, 0)

# 输出数据
print("Name:", person.Name().decode('utf-8'))
print("Age:", person.Age())
print("Hobbies:")
for hobby in person.HobbiesAsBytes():
    print("-", hobby.decode('utf-8'))