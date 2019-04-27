FROM nvidia/cudagl:9.2-devel

RUN apt update && apt install -y freeglut3-dev build-essential \
	vim-gnome git cmake python3 python3-dev python3-pip python3-tk  && \
	pip3 install numpy h5py

RUN pip3 install scipy sklearn matplotlib opencv-python torch torchvision

COPY . /DPI-Net
WORKDIR /DPI-Net

ENV DPI_ROOT /DPI-Net
ENV PYFLEXROOT ${DPI_ROOT}/PyFleX
ENV PYTHONPATH ${PYFLEXROOT}/bindings/build:$PYTHONPATH 
ENV LD_LIBRARY_PATH ${PYFLEXROOT}/external/SDL2-2.0.4/lib/x64:$LD_LIBRARY_PATH 

RUN cd PyFleX/bindings; mkdir build; cd build; cmake ..; make -j
