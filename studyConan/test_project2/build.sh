# export CONAN_USER_HOME="/Users/runge.liu/Documents/code/studyTools/studyConan/simple_lib/build"
rm -rf build
conan install .
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build .
