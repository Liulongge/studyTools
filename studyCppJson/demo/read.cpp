#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>

using json = nlohmann::json;

int main()
{
    // 从文件中读取 JSON 对象
    std::ifstream i("nested_json.json");
    json nested_json;
    if (i.is_open())
    {
        i >> nested_json;
        i.close();
        std::cout << "JSON object loaded from nested_json.json\n";
    }
    else
    {
        std::cerr << "Unable to open file for reading.\n";
        return 1;
    }

    // 打印整个 JSON 对象
    std::cout << "Nested JSON object:\n"
              << nested_json.dump(4) << "\n\n";

    // 检查并打印每个元素
    if (nested_json.contains("name"))
    {
        std::string name = nested_json["name"];
        std::cout << "\"name\" exists in the JSON object: " << name << "\n";
    }
    else
    {
        std::cout << "\"name\" does not exist in the JSON object.\n";
    }

    if (nested_json.contains("age"))
    {
        int age = nested_json["age"];
        std::cout << "\"age\" exists in the JSON object: " << age << "\n";
    }
    else
    {
        std::cout << "\"age\" does not exist in the JSON object.\n";
    }

    if (nested_json.contains("address") && nested_json["address"].is_object())
    {
        const auto &address = nested_json["address"];

        if (address.contains("street"))
        {
            std::string street = address["street"];
            std::cout << "\"address.street\" exists in the JSON object: " << street << "\n";
        }
        else
        {
            std::cout << "\"address.street\" does not exist in the JSON object.\n";
        }

        if (address.contains("city"))
        {
            std::string city = address["city"];
            std::cout << "\"address.city\" exists in the JSON object: " << city << "\n";
        }
        else
        {
            std::cout << "\"address.city\" does not exist in the JSON object.\n";
        }

        if (address.contains("state"))
        {
            std::string state = address["state"];
            std::cout << "\"address.state\" exists in the JSON object: " << state << "\n";
        }
        else
        {
            std::cout << "\"address.state\" does not exist in the JSON object.\n";
        }
    }
    else
    {
        std::cout << "\"address\" does not exist or is not an object in the JSON object.\n";
    }

    if (nested_json.contains("phone_numbers") && nested_json["phone_numbers"].is_object())
    {
        const auto &phone_numbers = nested_json["phone_numbers"];

        if (phone_numbers.contains("home"))
        {
            std::string home_phone = phone_numbers["home"];
            std::cout << "\"phone_numbers.home\" exists in the JSON object: " << home_phone << "\n";
        }
        else
        {
            std::cout << "\"phone_numbers.home\" does not exist in the JSON object.\n";
        }

        if (phone_numbers.contains("work"))
        {
            std::string work_phone = phone_numbers["work"];
            std::cout << "\"phone_numbers.work\" exists in the JSON object: " << work_phone << "\n";
        }
        else
        {
            std::cout << "\"phone_numbers.work\" does not exist in the JSON object.\n";
        }
    }
    else
    {
        std::cout << "\"phone_numbers\" does not exist or is not an object in the JSON object.\n";
    }

    // 检查不存在的键
    if (nested_json.contains("email"))
    {
        std::cout << "\"email\" exists in the JSON object.\n";
    }
    else
    {
        std::cout << "\"email\" does not exist in the JSON object.\n";
    }

    return 0;
}
