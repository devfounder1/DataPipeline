#include <iostream>
#include "core/message_queue.h"

using namespace datapipeline;

int main() {
    std::cout << " DataPipeline started!\n";
    
    ThreadSafeQueue<int> queue;
    queue.push(42);
    
    auto result = queue.try_pop();
    if (result) {
        std::cout << " Received: " << result.value() << "\n";
    }
    
    return 0;
}