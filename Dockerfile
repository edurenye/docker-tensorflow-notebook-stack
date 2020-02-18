FROM jupyter/tensorflow-notebook

USER root

RUN apt-get update && apt-get install -y \
    libcusparse8.0 \
    libnvrtc8.0 \
    libnvtoolsext1

RUN ln -snf /usr/lib/x86_64-linux-gnu/libnvrtc-builtins.so.8.0 /usr/lib/x86_64-linux-gnu/libnvrtc-builtins.so

RUN apt-get install -y \
    xvfb \
    freeglut3-dev \
    ffmpeg

USER $NB_UID

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c conda-forge jupyter_nbextensions_configurator
RUN conda install -c damianavila82 rise
RUN pip install keras-rl2
RUN pip install gym
RUN pip install gym[atari]

RUN pip -q install pyglet
RUN pip -q install pyopengl
RUN pip -q install pyvirtualdisplay
