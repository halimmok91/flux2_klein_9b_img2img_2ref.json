# Build forced: 2026-03-14-v3
FROM runpod/worker-comfyui:5.7.1-base

# Update ComfyUI to latest version that supports flux2
RUN cd /comfyui && \
    git remote set-url origin https://github.com/comfyanonymous/ComfyUI.git && \
    git fetch origin master && \
    git checkout master && \
    git pull origin master && \
    pip install -r requirements.txt -q

# Remove test input
RUN rm -f /comfyui/.runpod/tests.json
