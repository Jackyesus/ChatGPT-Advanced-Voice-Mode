# Use a base image with Python
FROM python:3.9-slim

# Install FFmpeg
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy your application files
COPY . .

# Install your Python dependencies
RUN pip install -r requirements.txt

# Expose the port your app runs on
EXPOSE 8080

# Command to run your app
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8080"]
