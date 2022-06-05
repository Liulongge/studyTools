# Flame Graph使用

## 1、android端
    1、simpleperf工具推入
    一般手机、system/bin/下自带simpleperf工具，若没有可将ndk中simpleperf工具推入/data/local/tmp下$ adb push simpleperf /data/local/tmp, 并赋予可执行权限$ adb shell chmod 777 /data/local/tmp/simpleperf。

    2、采样
    $ ./simpleperf record -p xxx(pid 或tid) -g -o /data/local/tmp/perf.data --duration xxx(时间) -f xxxHz
    例如： $ ./simpleperf record -p 12345 -g -o /data/local/tmp/perf.data --duration 10 -f 99

    -p <pid>: pid号
    --duration <采样时长>: 单位/秒
    -f <采样频率>: Hz, 推荐值100 - 200, 该工具比价占用内存和loading
    补充：可以单线程抓取，-t <tid>

    3、拉取采样数据
    $ adb pull /data/local/tmp/perf.data perf.data 

    4、转换，可视化
    下载该工具:
    https://github.com/Liulongge/FlameGraph
    或
    https://github.com/brendangregg/FlameGraph

    $ python ./report_sample.py perf.data > out.perf
    $ ./stackcollapse-perf.pl out.perf > out.folded
    $ ./flamegraph.pl out.folded > demo.svg
