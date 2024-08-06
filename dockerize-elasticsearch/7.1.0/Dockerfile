FROM docker.elastic.co/elasticsearch/elasticsearch:7.10.0

COPY bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 0775 /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
# Dummy overridable parameter parsed by entrypoint
CMD ["eswrapper"]