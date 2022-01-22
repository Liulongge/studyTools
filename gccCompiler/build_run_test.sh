rm -rf demo

export PATH=./GCC-11.2.0/bin:$PATH
export LD_LIBRARY_PATH=./GCC-11.2.0/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./GCC-11.2.0/lib64:$LD_LIBRARY_PATH

g++ test.cpp -o demo

./demo

strings -a demo | grep -i GCC