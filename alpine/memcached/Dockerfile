FROM alpine

# Update the package repository and install applications
RUN apk --no-cache --update add memcached && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

ENV MEMCACHED_MEMORY 1024
ENV MEMCACHED_MAX_CONNECTIONS 1024
ENV MEMCACHED_MAX_ITEM_SIZE 8M

COPY start.sh /start.sh
RUN chmod 755 /start.sh

# Expose port 11211
EXPOSE 11211

CMD ["/start.sh"]

USER memcached
