# PRJCTR HW8: Nginx fine tune

This repository contains [nginx](https://nginx.org/) configuration with enabled caching.
In this example nginx will cache images that were requested at least twice.
Also cache invalidation endpoint was added.

### Prerequisites

[Docker](https://www.docker.com/products/docker-desktop/) installation.

### Starting web app

Execute starting script:
```bash
$ bash start.sh
```

Then you can execute following command to check nginx headers: 
```bash
$ curl -I http://127.0.0.1:8080/images/image_1.jpeg
```

You can also visit http://127.0.0.1:8080/images/image_1.jpeg to see 
beautiful images.

Feel free to add any changes to `nginx.conf` or `start.sh` files. 
To restart the server with new configuration you just need to 
execute `start.sh` script one more time. It will automatically remove
previous docker container and create a new one with updated settings.

### Results

I wanted to test if nginx really caches images and invalidates it 
when specific headers are passed. For this I've 
[tried to receive](https://github.com/kirill-kundik/prjctr-hsa-homework-8/blob/main/nginx.conf#L38) 
cache status (`HIT`, `MISSED` or `EXPIRED`). But received only my debug 
header without upstream cache status variable. 

Also checked `/var/cache/nginx` directory inside docker container 
before and after hitting some images several times, but nothing 
was changed/appeared in that dir.

However, I think my configuration should work.
![Carpathian mountains](./images/image_1.jpeg)
