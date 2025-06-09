#include <iostream>
#include "backward.hpp"

void crash_function() {
    // 人为制造段错误
    int* ptr = nullptr;
    *ptr = 42;
}

int main() {
    // 初始化信号处理
    backward::SignalHandling sh;
    
    if (!sh.loaded()) {
        std::cerr << "Failed to setup signal handlers\n";
        return 1;
    }
    
    std::cout << "Program started (will crash in 3 seconds...)\n";
    
    // 延迟几秒以便观察
    #ifdef _WIN32
    Sleep(3000);
    #else
    sleep(3);
    #endif
    
    crash_function();
    
    return 0;
}