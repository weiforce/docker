FROM ivories/rust

RUN apt update
RUN apt -y install nginx

RUN rm -rf /etc/nginx/sites-enabled
RUN rm -rf /etc/nginx/sites-available  

#RUN apt update && apt install -y curl

#ENV RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
#ENV RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

#RUN curl https://getsubstrate.io -sSf | bash
