# from conan import ConanFile
# from conan.tools.cmake import CMake, cmake_layout
# from conan.tools.files import copy
# from pathlib import Path

# class SimpleLibConan(ConanFile):
#     name = "simple_lib"
#     version = "1.0.0"
#     settings = "os", "compiler", "build_type", "arch"
#     generators = "CMakeToolchain", "CMakeDeps"
#     exports_sources = "include/*", "src/*", "CMakeLists.txt"

#     def layout(self):
#         # 自定义构建目录
#         self.folders.source = "."  # 源码目录
#         self.folders.build = "./build"  # 构建目录

#     def build(self):
#         cmake = CMake(self)
#         cmake.configure()
#         cmake.build()

#     def package(self):
#         cmake = CMake(self)
#         cmake.install()

#         # 手动将文件复制到指定目录
#         lib_dir = Path("./build/lib")
#         include_dir = Path("./build/include")

#         # 创建目标目录
#         lib_dir.mkdir(parents=True, exist_ok=True)
#         include_dir.mkdir(parents=True, exist_ok=True)

#         # 复制库文件
#         copy(self, "*.a", src=Path("build"), dst=lib_dir)
#         # 复制头文件
#         copy(self, "*.h", src=Path("include"), dst=include_dir)

#     def package_info(self):
#         self.cpp_info.libs = ["simple_lib"]

from conan import ConanFile
from conan.tools.cmake import CMake, cmake_layout
from conan.tools.files import copy
from pathlib import Path

class SimpleLibConan(ConanFile):
    name = "simple_lib"
    version = "1.0.0"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps"
    exports_sources = "include/*", "src/*", "CMakeLists.txt"

    def layout(self):
        # 自定义构建和打包目录
        self.folders.source = "."  # 源码目录
        self.folders.build = "build"  # 构建目录
        self.folders.package = "package"  # 打包目录

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()

        # 手动将文件复制到指定目录
        lib_dir = Path("/Users/runge.liu/Documents/code/studyTools/studyConan/simple_lib/build/lib")
        include_dir = Path("/Users/runge.liu/Documents/code/studyTools/studyConan/simple_lib/build/include")

        # 创建目标目录
        lib_dir.mkdir(parents=True, exist_ok=True)
        include_dir.mkdir(parents=True, exist_ok=True)

        # 复制库文件
        copy(self, "*.a", src=Path(self.build_folder), dst=lib_dir)
        # 复制头文件
        copy(self, "*.h", src=Path(self.source_folder) / "include", dst=include_dir)

    def package_info(self):
        self.cpp_info.libs = ["simple_lib"]