FROM nvidia/cudagl:9.2-devel

RUN apt update && apt install -y freeglut3-dev build-essential \
	vim-gnome git cmake python3 python3-dev python3-pip python3-tk  && \
	pip3 install numpy 

COPY . /DPI-Net
WORKDIR /DPI-Net
ENV FleX_ROOT /DPI-Net

RUN export PYFLEXROOT=${PWD}/PyFleX && \
	export PYTHONPATH=${PYFLEXROOT}/bindings/build:$PYTHONPATH && \
	export LD_LIBRARY_PATH=${PYFLEXROOT}/external/SDL2-2.0.4/lib/x64:$LD_LIBRARY_PATH 


# Install bindings
# RUN pip install ./bindings
#; mkdir build; cd build; cmake ..; make -j