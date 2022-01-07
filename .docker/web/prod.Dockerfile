FROM node:15.14-alpine

# こいつを先に持ってこないとyarn の参照でコケる
COPY ./ /app
WORKDIR /app

RUN apk update && \
    apk add git make g++ && \
    apk add --no-cache curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    yarn global add create-next-app &&\
    yarn install && \
    yarn build

ENV TZ Asia/Tokyo
ENV PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH