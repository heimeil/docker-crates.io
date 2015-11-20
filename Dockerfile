FROM node:5-slim

ENV DEPS git-core
ENV WORKDIR /crates.io

RUN apt-get update \
	&& apt-get install -y $DEPS \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/rust-lang/crates.io.git $WORKDIR
WORKDIR $WORKDIR
RUN npm install

CMD npm start -- --proxy https://crates.io

EXPOSE 8888
