FROM ubuntu:bionic

RUN apt-get update -qq && apt-get upgrade -qq && apt-get install -qq -y \
	make=4.1-9.1ubuntu1 \
	g++=4:7.4.0-1ubuntu2.3 \
	bison=2:3.0.4.dfsg-1build1 \
	curl=7.58.0-2ubuntu3.8

RUN curl -o spin-6.5.0.tar.gz https://codeload.github.com/nimble-code/Spin/tar.gz/version-6.5.0
RUN tar -xf spin-6.5.0.tar.gz
RUN mkdir -p /usr/local/share/man/man1
RUN make -C Spin-version-6.5.0/Src && make -C Spin-version-6.5.0/Src install && rm -rf Spin-version-6.5.0 spin-6.5.0.tar.gz

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/spin"]
