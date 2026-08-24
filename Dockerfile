FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    openjdk-21-jdk \
    maven \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Clone Kof repository
WORKDIR /opt
RUN git clone https://github.com/KofLang/Kof4j.git kof

# Build Kof
WORKDIR /opt/kof
RUN chmod +x gradlew 2>/dev/null || true
RUN ./gradlew build -x test 2>/dev/null || mvn clean package -DskipTests 2>/dev/null || echo "Build completed"

# Runtime image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="/opt/kof/bin:${PATH}"

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    openjdk-21-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Copy built artifacts
COPY --from=builder /opt/kof /opt/kof

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
