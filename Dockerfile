FROM debian:stretch

WORKDIR /app

COPY . /app

EXPOSE 8080

# Install needed utilities
RUN apt-get update \
&& apt-get install -y build-essential \
&& apt-get install -y git \
&& apt-get install -y openjdk-8-jdk \
&& apt-get install -y java-wrappers \
&& apt-get install -y junit \
&& apt-get install -y cmake \
&& apt-get install -y software-properties-common \
&& apt-get install -y curl \
&& apt-get install -y libgtk2.0-dev \
&& apt-get install -y libv4l-dev \
&& apt-get install -y pkg-config \
&& apt-get install -y libavcodec-dev \
&& apt-get install -y libavformat-dev \
&& apt-get install -y libswscale-dev \
&& apt-get install -y python-dev \
&& apt-get install -y python-numpy \
&& apt-get install -y libtbb2 \
&& apt-get install -y libtbb-dev \
&& apt-get install -y libjpeg-dev \
&& apt-get install -y libpng-dev \
&& apt-get install -y libtiff-dev \
&& apt-get install -y libdc1394-22-dev \
&& apt-get install -y g++ \
&& apt-get install -y ant \
&& apt-get install -y maven

RUN export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 \
&& export ANT_HOME=/usr/bin/ant

# Get opencv 3.4 files from Git repository
# Set JAVA_HOME and make opencv lib
RUN git clone https://github.com/opencv/opencv.git \
&& cd opencv/ \
&& git checkout 3.4 \
&& mkdir build \
&& cd build \
&& rm ../CMakeCache.txt --force \
&& cmake -D BUILD_SHARED_LIBS=OFF .. \
&& make -j8

# Make .jar and .so visible for the Maven project
RUN mkdir /opencv-java-bin \
&& cp bin/opencv-346.jar lib/libopencv_java346.so /opencv-java-bin/ \
&& cp lib/libopencv_java346.so /usr/lib/x86_64-linux-gnu/

# Install project
RUN mvn install:install-file -Dfile=./opencv/build/bin/opencv-346.jar -DgroupId=org.opencv -DartifactId=opencv -Dversion=3.4.6 -Dpackaging=jar \
&& mvn clean install

# Run project with server available on localhost:8080
RUN java -cp target/fatjar-0.0.1-SNAPSHOT.jar main.Main
