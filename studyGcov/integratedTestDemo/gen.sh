
pkill -15 demo

mv demo.gcda run

cp -r ./build/demo.gcno rawdata
cp -r ./run/demo.gcda rawdata

sudo lcov -c -d ./rawdata -o out/demo.info --rc lcov_branch_coverage=1
sudo genhtml -o out/html out/demo.info 