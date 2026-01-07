apt update
apt install tmux -y

mkdir -p /workspace/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /workspace/miniconda3/miniconda.sh
bash /workspace/miniconda3/miniconda.sh -b -u -p /workspace/miniconda3
rm /workspace/miniconda3/miniconda.sh

source /workspace/miniconda3/bin/activate

conda init --all

conda config --add envs_dirs /workspace/conda/envs
conda config --add pkgs_dirs /workspace/conda/pkgs

conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

./install_env.sh 3dgrut WITH_GCC11

conda activate 3dgrut

# if system uses GCC >12 then install gcc=11 gxx=11
conda install -c conda-forge gcc=11 gxx=11