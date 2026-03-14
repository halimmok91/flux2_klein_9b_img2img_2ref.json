FROM runpod/worker-comfyui:5.7.1-base

# Completely replace ComfyUI with latest version
RUN pip install --upgrade --force-reinstall \
    "comfyui>=0.7.0" 2>/dev/null || \
    pip install git+https://github.com/comfyanonymous/ComfyUI.git

# Remove test input to avoid conflicts
RUN rm -f /comfyui/.runpod/tests.json
