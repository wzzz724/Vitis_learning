#include <stdint.h>
#include <hls_stream.h>
#include <math.h>

float result = 0.0;

void load_input(float* in, hls::stream<float>& inStream, int size) {
mem_rd:
    for (int i = 0; i < size; i++) {
        inStream << in[i];
    }
}

void scoring_product(hls::stream<float>& in1_stream, hls::stream<float>& in2_stream, hls::stream<float>& out_stream, int size) {
    for (int i = 0; i < size; i++) {
        result += (in1_stream.read() * in2_stream.read());
    }
}

void scoring_cosine(hls::stream<float>& in1_stream, hls::stream<float>& in2_stream, hls::stream<float>& out_stream, int size) {
    float dot_product = 0.0;
    float norm1 = 0.0;
    float norm2 = 0.0;
    for (int i = 0; i < size; i++) {
        float ele1 = in1_stream.read();
        float ele2 = in2_stream.read();
        dot_product += ele1 * ele2;
        norm1 += ele1 * ele1;
        norm2 += ele2 * ele2;
    }
    result = dot_product / (sqrt(norm1) * sqrt(norm2));
}

void scoring_euclidean(hls::stream<float>& in1_stream, hls::stream<float>& in2_stream, hls::stream<float>& out_stream, int size) {
    float sum = 0.0;
    for (int i = 0; i < size; i++) {
        float diff = in1_stream.read() - in2_stream.read();
        sum += diff * diff;
    }
    result = sqrt(sum);
}


extern "C" {
void krnl_scoring(int type, float* in1, float* in2, float* out, int size) {
 #pragma HLS INTERFACE m_axi port = in1 bundle = gmem0
 #pragma HLS INTERFACE m_axi port = in2 bundle = gmem1
 #pragma HLS INTERFACE m_axi port = out bundle = gmem0

    static hls::stream<float> in1_stream("input_stream_1");
    static hls::stream<float> in2_stream("input_stream_2");

#pragma HLS DATAFLOW
    load_input(in1, in1_stream, size);
    load_input(in2, in2_stream, size);

    switch (type) {
        case 0:
            scoring_product(in1_stream, in2_stream, in2_stream, size);
            break;
        case 1:
            scoring_cosine(in1_stream, in2_stream, in2_stream, size);
            break;
        case 2:
            scoring_euclidean(in1_stream, in2_stream, in2_stream, size);
            break;
    }

    *out = result;
}
}
