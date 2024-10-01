#!/usr/bin/env bash
#SBATCH -A NAISS2023-5-429
#SBATCH -p alvis
#SBATCH --gpus-per-node=T4:1
#SBATCH -t 0-01:00:00

ml purge  # Ensure we don't have any conflicting modules loaded

ml SciPy-bundle/2022.05-foss-2022a
ml scikit-learn/1.1.2-foss-2022a
ml OpenCV/4.6.0-foss-2022a-CUDA-11.7.0-contrib
ml PyTorch-bundle/1.12.1-foss-2022a-CUDA-11.7.0
ml matplotlib/3.5.2-foss-2022a

source /cephyr/users/telio/hti-cnn/my_venv-hti/bin/activate
python main.py --config /configs/my_gapnet.json --checkpoint /mimer/NOBACKUP/groups/naiss2023-6-290/telio/hti-cnn-model/gapnet.pth.tar --gpu 0 --j 4 --training.batchsize 8