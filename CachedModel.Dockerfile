# Use existing worker as the parent image
FROM runpod/worker-v1-vllm:v2.4.0stable-cuda12.1.0

# ----‑ Build‑time arguments ----
ARG MODEL_NAME="voa-engines/Charcot-72B-Instruct-0.2"
ARG MODEL_REVISION="main"
ARG BASE_PATH="/models"
ARG QUANTIZATION="bitsandbytes"

ENV TRUST_REMOTE_CODE=true \
    TENSOR_PARALLEL_SIZE=4 \
    PIPELINE_PARALLEL_SIZE=1 \
    MAX_MODEL_LEN=32768 \
    ENABLE_PREFIX_CACHING=true \
    ENABLE_CHUNKED_PREFILL=true \
    GPU_MEMORY_UTILIZATION=0.95 \
    OPENAI_SERVED_MODEL_NAME_OVERRIDE="Charcot-72B"