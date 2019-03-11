#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -p 80:80 \
        -e "PGADMIN_DEFAULT_EMAIL=neil_han@intuit.com" \
        -e "PGADMIN_DEFAULT_PASSWORD=password" \
        -d dpage/pgadmin4
