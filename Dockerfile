FROM runpod/worker-comfyui:5.7.1-base

# Remove old ComfyUI and install latest from scratch
RUN pip install comfy-cli && \
    comfy --skip-prompt install --nvidia --version nightly --fast-deps 2>/dev/null || true

# Force upgrade ComfyUI via pip
RUN pip install --upgrade comfyui

# Install comfyui from git directly
RUN pip uninstall comfyui -y 2>/dev/null || true && \
    pip install git+https://github.com/comfyanonymous/ComfyUI.git

# Remove test input
RUN rm -f /runpod-volume/.runpod/tests.json
