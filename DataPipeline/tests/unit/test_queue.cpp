#include <gtest/gtest.h>
#include "core/message_queue.h"

using namespace datapipeline;

TEST(ThreadSafeQueueTest, PushAndPop) {
    ThreadSafeQueue<int> queue;
    queue.push(42);
    auto result = queue.pop();
    ASSERT_TRUE(result.has_value());
    EXPECT_EQ(result.value(), 42);
}

TEST(ThreadSafeQueueTest, EmptyQueue) {
    ThreadSafeQueue<int> queue;
    auto result = queue.try_pop();
    EXPECT_FALSE(result.has_value());
    EXPECT_TRUE(queue.empty());
}

TEST(ThreadSafeQueueTest, MultipleThreads) {
    ThreadSafeQueue<int> queue;
    const int num_items = 100;
    int sum = 0;
    std::mutex sum_mutex;
    
    std::thread producer([&]() {
        for (int i = 1; i <= num_items; ++i) {
            queue.push(i);
        }
        queue.stop();
    });
    
    std::thread consumer([&]() {
        while (true) {
            auto item = queue.pop();
            if (!item.has_value()) break;
            std::lock_guard<std::mutex> lock(sum_mutex);
            sum += item.value();
        }
    });
    
    producer.join();
    consumer.join();
    
    EXPECT_EQ(sum, num_items * (num_items + 1) / 2);
}

TEST(ThreadSafeQueueTest, StopUnblocksWaiters) {
    ThreadSafeQueue<int> queue;
    bool unblocked = false;
    
    std::thread waiter([&]() {
        auto result = queue.pop();
        unblocked = (result == std::nullopt);
    });
    
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    
    queue.stop();
    waiter.join();
    
    EXPECT_TRUE(unblocked);
}