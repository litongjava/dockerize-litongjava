FROM postgres:16.3

# Set the pgvector version
ARG PGVECTOR_VERSION=0.5.1

# Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        build-essential \
        curl \
        postgresql-server-dev-16

# Download and extract the pgvector release, build the extension, and install it.
RUN curl -f -L -o pgvector.tar.gz "https://github.com/pgvector/pgvector/archive/refs/tags/v${PGVECTOR_VERSION}.tar.gz" && \
    tar -xzf pgvector.tar.gz && \
    cd "pgvector-${PGVECTOR_VERSION}" && \
    make OPTFLAGS="" && \
    make install && \
    mkdir /usr/share/doc/pgvector && \
    cp LICENSE README.md /usr/share/doc/pgvector

# Clean up build dependencies and temporary files
RUN apt-get remove -y build-essential curl postgresql-server-dev-16 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /pgvector.tar.gz /pgvector-${PGVECTOR_VERSION}

# add custom docker-entrypoint.sh
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
