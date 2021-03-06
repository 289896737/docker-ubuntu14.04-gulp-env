FROM ubuntu:14.04
copy /gulpfile.js /gulpfile.js
copy /package.json /package.json
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://nodejs.org/download/release/v7.5.0/node-v7.5.0-linux-x64.tar.gz
RUN tar -zxvf node-v7.5.0-linux-x64.tar.gz
RUN rm -rf node-v7.5.0-linux-x64.tar.gz 
RUN ln -s /node-v7.5.0-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /node-v7.5.0-linux-x64/bin/npm /usr/local/bin/npm
RUN npm config set prefix /usr/local
RUN npm root

RUN npm --version
RUN npm -g install run-sequence amd-optimize apache-server-configs
RUN npm -g install archiver del event-stream glob gulp gulp-autoprefixer
RUN npm -g install gulp-changed gulp-concat gulp-header
RUN npm -g install gulp-if gulp-jshint gulp-less gulp-load-plugins
RUN npm -g install gulp-minify-css gulp-minify-html gulp-order gulp-rename
RUN npm -g install gulp-replace gulp-rev gulp-rev-collector
RUN npm -g install gulp-uglify gulp-util jquery jshint
RUN npm -g install jshint-stylish map-stream mocha normalize.css 
RUN npm -g install sequence through2 gulp-css-spritesmith
RUN npm -g install browser-sync 
RUN npm config set proxy=http://172.17.18.84:8080
RUN npm config set https-proxy=http://172.17.18.84:8080
RUN npm config set registry https://registry.npm.taobao.org
ENV NODE_PATH /usr/local/lib/node_modules
RUN npm link gulp
RUN gulp
RUN wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz
RUN tar -zxvf jdk-8u51-linux-x64.tar.gz
RUN rm -rf jdk-8u51-linux-x64.tar.gz
ENV JAVA_HOME /jdk1.8.0_51
ENV PATH ${JAVA_HOME}/bin:$PATH
RUN java -version



