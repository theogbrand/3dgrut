mkdir -p /ob1_ws/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /ob1_ws/miniconda3/miniconda.sh
bash /ob1_ws/miniconda3/miniconda.sh -b -u -p /ob1_ws/miniconda3
rm /ob1_ws/miniconda3/miniconda.sh

source /ob1_ws/miniconda3/bin/activate

conda init --all

conda config --add envs_dirs /ob1_ws/conda/envs
conda config --add pkgs_dirs /ob1_ws/conda/pkgs

conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

./install_env.sh 3dgrut WITH_GCC11