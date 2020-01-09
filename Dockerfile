FROM debian:stretch

# Install Dependencies.
RUN apt update -y
RUN apt install -y \
  git \
  curl \
  unzip
    
# Install Flutter
ENV FLUTTER_ROOT="/opt/flutter"
RUN git clone https://github.com/flutter/flutter "${FLUTTER_ROOT}"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"

# Enable web support
RUN flutter channel beta
RUN flutter config --enable-web

# Disable analytics and crash reporting on the builder.
RUN flutter config  --no-analytics

# Perform an artifact precache so that no extra assets need to be downloaded on demand.
RUN flutter precache
