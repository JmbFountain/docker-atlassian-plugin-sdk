#!/bin/bash
docker run -it --name atlassian-plugin-sdk -p 2990:2990 -v $(pwd):/repo jmbfountain/atlassian-plugin-sdk:latest /bin/bash
