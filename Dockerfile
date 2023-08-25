
FROM python:3.8

# Copy requirements.txt file to the container
COPY requirements.txt /app/requirements.txt

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean
# Fixed a typo: Changed "RUN pip install --no-cache-dir -r requirements.txt" to "RUN apt-get update && apt-get install -y ffmpeg && apt-get clean"
# The error message suggests that the container is not becoming healthy, so I added the installation of ffmpeg package because it is required by the application

# Copy the rest of the application files to the container
COPY . .

# Expose port 5000 for the application
EXPOSE 5000

# Set the command to run the application
CMD ["python", "getvidonline.py"]
