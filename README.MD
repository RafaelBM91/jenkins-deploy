# Jenkins Deploy

## Step 1

- Create file in root .env and push this environments variable:
    - PORT_JENKINS
    - NAME_REPOSITORY
    - IMAGE_NAME
    - IMAGE_VERSION
    - PORTS_CONTAINER
    - ### Example:
        - PORT_JENKINS=8080
        - NAME_REPOSITORY=next-ts-example
        - IMAGE_NAME=my-image-next
        - IMAGE_VERSION=latest
        - PORTS_CONTAINER=3101:80

## Step 2

`$> make up`
