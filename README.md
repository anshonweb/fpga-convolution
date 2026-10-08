# fpga-convolution

Learning and implementation project focused on translating image-processing
algorithms into hardware and optimizing them for FPGA execution.

The project progressively explores RTL, convolution, memory, parallelism,
pipelining, and FPGA optimization.

## Development Stages

### 1. Digital Logic & RTL
- [ ] Basic digital circuits
- [ ] Sequential logic
- [ ] FSMs
- [ ] Verilog RTL
- [ ] Testbenches & simulation

### 2. Software Reference
- [ ] Python/NumPy convolution
- [ ] 3×3 kernels
- [ ] Golden reference output

### 3. Basic Convolution
- [ ] 3×3 convolution in Verilog
- [ ] Multiplication & adder tree
- [ ] Verify RTL against Python

### 4. Memory & Streaming
- [ ] Image memory / BRAM
- [ ] Pixel addressing
- [ ] Line buffers
- [ ] Sliding-window architecture

### 5. Parallelism & Optimization
- [ ] Parallel MAC units
- [ ] Adder tree
- [ ] Pipelining
- [ ] Latency & throughput analysis
- [ ] Resource optimization

### 6. FPGA Implementation
- [ ] Synthesis & implementation
- [ ] LUT / FF / DSP / BRAM analysis
- [ ] Fmax measurement
- [ ] FPGA hardware testing

### 7. CNN Extension
- [ ] Bias & ReLU
- [ ] Fixed-point arithmetic
- [ ] Quantization
- [ ] Small CNN
- [ ] MNIST inference

## Architecture

```text
Python Reference
       ↓
   Verilog RTL
       ↓
    Simulation
       ↓
  Basic Convolution
       ↓
  Memory / BRAM
       ↓
 Sliding Window
       ↓
   Parallel MAC
       ↓
    Pipeline
       ↓
 FPGA Accelerator
       ↓
  CNN Accelerator