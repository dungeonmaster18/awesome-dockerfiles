FROM swift:latest

LABEL maintainer "Umesh Yadav <umesh4257@gmail.com>"

RUN git clone https://github.com/realm/SwiftLint.git
WORKDIR "SwiftLint"

RUN git submodule update --init --recursive; make install
RUN cd ../ && rm -rf SwiftLint

RUN swiftlint version

WORKDIR "/swiftlint"

ENTRYPOINT ["swiftlint"]
