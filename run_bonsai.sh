mkdir data && cd data
apt install unzip -y
wget http://storage.googleapis.com/gresearch/refraw360/360_v2.zip
unzip 360_v2.zip -d mipnerf360

# train from COLMAP to USDZ
python train.py --config-name apps/colmap_3dgut.yaml path=data/mipnerf360/bonsai out_dir=runs experiment_name=bonsai_3dgut dataset.downsample_factor=2 export_usdz.enabled=true
# MCMC recommended by NVIDIA guide "Run 3DGUT Training and Export to USDZ" (https://docs.nvidia.com/nurec/robotics/neural_reconstruction_mono.html#step-3-train-dense-3d-reconstruction-with-3dgut)
python train.py --config-name apps/colmap_3dgut_mcmc.yaml path=data/mipnerf360/bonsai out_dir=runs experiment_name=bonsai_3dgut_mcmc dataset.downsample_factor=2 export_usdz.enabled=true export_usdz.apply_normalizing_transform=true

# convert PLY files to USDZ
python -m threedgrut.export.scripts.ply_to_usd /workspace/3dgrut/data/best-griffin-splat.ply --output_file /workspace/3dgrut/data/best-griffin-splat.usdz