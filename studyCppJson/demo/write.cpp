#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>

using json = nlohmann::json;

int main()
{
    // 创建一个多层嵌套的 JSON 对象
    json nested_json;

    // 添加基本信息
    nested_json["name"] = "John Doe";
    nested_json["age"] = 30;

    // 添加地址信息
    nested_json["address"]["street"] = "123 Main St";
    nested_json["address"]["city"] = "Anytown";
    nested_json["address"]["state"] = "CA";

    // 添加电话号码
    nested_json["phone_numbers"]["home"] = "555-1234";
    nested_json["phone_numbers"]["work"] = "555-5678";

    // 打印整个 JSON 对象
    std::cout << "Nested JSON object:\n"
              << nested_json.dump(4) << "\n\n";

    // 将 JSON 对象保存到文件
    std::ofstream o("nested_json.json");
    if (o.is_open())
    {
        o << nested_json.dump(4);
        o.close();
        std::cout << "JSON object saved to nested_json.json\n";
    }
    else
    {
        std::cerr << "Unable to open file for writing.\n";
    }

    return 0;
}
