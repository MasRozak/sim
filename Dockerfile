FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy server and data
COPY server.py .
COPY dfTransjakarta1_4MRows.csv .

# Expose WebSocket port
EXPOSE 8765

# Environment defaults
ENV CSV_PATH=dfTransjakarta1_4MRows.csv
ENV WS_HOST=0.0.0.0
ENV WS_PORT=8765
ENV SPEED_MULTIPLIER=60
ENV BATCH_INTERVAL_MS=100
ENV AUTO_START=false

CMD ["python", "server.py"]
