
FROM python:3.8

# Copy requirements.txt file to the container
COPY requirements.txt /app/requirements.txt

# Set the working directory to /app
WORKDIR /app

# Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean
# I added the installation of ffmpeg package because it is required by the application. This should fix the error of the container not becoming healthy.

# Copy the rest of the application files to the container
COPY . .

# Expose port 5000 for the application
EXPOSE 443

# Set the command to run the application
CMD ["python","app.py"]
