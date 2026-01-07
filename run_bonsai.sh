mkdir data && cd data
apt install unzip -y
wget http://storage.googleapis.com/gresearch/refraw360/360_v2.zip
unzip 360_v2.zip -d mipnerf360

# train from COLMAP to USDZ
python train.py --config-name apps/colmap_3dgut.yaml path=mipnerf360/bonsai out_dir=runs experiment_name=bonsai_3dgut dataset.downsample_factor=2 export_usdz.enabled=true

# convert PLY files to USDZ
python -m threedgrut.export.scripts.ply_to_usd path/to/your/model.ply --output_file path/to/output.usdz