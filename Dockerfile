FROM runpod/worker-comfyui:5.7.1-base

# Update ComfyUI to latest version (adds flux2 CLIPLoader support)
RUN cd /comfyui && git fetch --all && git pull origin master

# Install updated dependencies
RUN cd /comfyui && pip install -r requirements.txt -q

# Also download missing text encoder
RUN comfy model download \
    --url https://huggingface.co/black-forest-labs/FLUX.2-klein-9B/resolve/main/qwen_3_8b_fp8mixed.safetensors \
    --relative-path models/text_encoders \
    --filename qwen_3_8b.safetensors

# Remove test input to avoid conflicts
RUN rm -f /runpod-volume/.runpod/tests.json
