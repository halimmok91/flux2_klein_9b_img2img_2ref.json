# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# (no custom registry-verified or unknown nodes were provided in the workflow)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/dx8152/Flux2-Klein-9B-Consistency/resolve/main/Klein-consistency.safetensors --relative-path models/loras --filename Klein-9b-consistency.safetensors
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.2-klein-9B/resolve/main/flux-2-klein-9b.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b.safetensors
# RUN # Could not find URL for qwen_3_8b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
