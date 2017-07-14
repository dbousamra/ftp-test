FROM haskell:8.0.2
MAINTAINER Dominic Bou-Samra <dom@imageintelligence.com>

WORKDIR /app/ftp-test

# optionally cache the package index too
RUN stack update

COPY ftp-test.cabal /app/ftp-test
COPY stack.yaml /app/ftp-test

RUN stack install --only-dependencies

COPY . /app/ftp-test

RUN stack install

CMD ["stack","exec","ftp-test"]
