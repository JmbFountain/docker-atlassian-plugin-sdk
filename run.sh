#!/bin/bash
docker run -it -p 2990:2990 -v $(pwd):/repo jmbfountain/atlassian-plugin-sdk:latest /bin/bash
