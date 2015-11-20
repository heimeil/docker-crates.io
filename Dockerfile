FROM node:5-slim

ENV DEPS git-core
ENV TMPDIR /tmp/crates.io

RUN apt-get update \
	&& apt-get install -y $DEPS \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/rust-lang/crates.io.git $TMPDIR
WORKDIR $TMPDIR
RUN npm install

CMD npm start -- --proxy https://crates.io

EXPOSE 8888
