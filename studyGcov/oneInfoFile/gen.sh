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

./build/demo 3 3 3
mv demo.gcda run

cp -r ./build/demo.gcno rawdata
cp -r ./run/demo.gcda rawdata

sudo lcov -c -d ./rawdata -o out/demo.info --rc lcov_branch_coverage=1
sudo genhtml -o out/html out/demo.info 