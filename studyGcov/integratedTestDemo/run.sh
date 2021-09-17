sudo rm -rf out
sudo rm -rf build
sudo rm -rf run
sudo rm -rf rawdata
mkdir out
mkdir build
mkdir run
mkdir rawdata

g++ src/demo.cpp -o build/demo -fprofile-arcs -ftest-coverage
mv demo.gcno build

./build/demo