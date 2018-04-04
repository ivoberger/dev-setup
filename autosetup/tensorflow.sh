curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/cuda-repo-ubuntu1704_9.1.85-1_amd64.deb

sudo apt update
sudo apt install -y python-pip python3-pip cuda-9-0

# install cudNN
cp files/cudnn-9.0-linux-x64-v7.tgz /tmp
cd /tamp
sudo tar -xzvf cudnn-9.0-linux-x64-v7.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc

source ~/.bashrc
sudo -H pip3 install tensorflow-gpu keras
sudo -H pip2 install tensorflow-gpu keras
