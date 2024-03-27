#include "experimental/xrt_kernel.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_bo.h"
#include "experimental/xrt_aie.h"

#include "types.h"
#include <stdlib.h>
#include <iostream>
#include <random>
#include <ctime>

unsigned int DATA_SIZE = 4096;

int main(int argc, char **argv) {
    unsigned int device_index = 0;
    auto device = xrt::device(device_index);

    std::string xclbinFilename = argv[1];
    auto uuid = device.load_xclbin(xclbinFilename);

    size_t size_in_bytes = DATA_SIZE * sizeof(float);
    auto krnl = xrt::kernel(device, uuid, "krnl_scoring_unit");

    auto bo_in1 = xrt::bo(device, size_in_bytes, krnl.group_id(0));
    auto bo_in2 = xrt::bo(device, size_in_bytes, krnl.group_id(1));
    auto bo_out = xrt::bo(device, sizeof(float), krnl.group_id(2));

    auto bo_in1_map = bo_in1.map<float *>();
    auto bo_in2_map = bo_in2.map<float *>();
    auto bo_out_map = bo_out.map<float *>();
    std::fill(bo_in1_map, bo_in1_map + DATA_SIZE, 0);
    std::fill(bo_in2_map, bo_in2_map + DATA_SIZE, 0);
    std::fill(bo_out_map, bo_out_map + 1, 0);

    std::default_random_engine generator;
    std::uniform_real_distribution<float> distribution(0.0, 1.0);
    e.seed(time(0));

    for (int i = 0; i < DATA_SIZE; i++) {
        bo_in1_map[i] = distribution(generator);
        bo_in2_map[i] = distribution(generator);
    }

    bo_in1.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    bo_in2.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    auto run = krnl(0, bo_in1, bo_in2, bo_out, DATA_SIZE);
    run.wait();

    bo_out.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

    std::cout << "Result: " << bo_out_map[0] << std::endl;
}