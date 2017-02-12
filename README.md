[![Build Status](https://travis-ci.org/ianmartorell/dust-calculator.svg?branch=master)](https://travis-ci.org/ianmartorell/dust-calculator)
[![Docker Repository on Quay](https://quay.io/repository/ian/dust-calculator/status "Docker Repository on Quay")](https://quay.io/repository/ian/dust-calculator)

For example:

```
docker run -d \
--name=mongo \
--restart=always \
-p=27017:27017 \
mongo:3.2

docker run -d \
--name=dust \
--restart=always \
-p 3000:80 \
--link mongo:mongo \
-e ROOT_URL=http://mydomain.com \
-e MONGO_URL=mongodb://mongo:27017/dust \
quay.io/ian/dust-calculator
```
