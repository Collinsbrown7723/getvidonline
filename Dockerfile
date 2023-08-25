
FROM python:3.8

# Copy requirements.txt file to the container
COPY requirements.txt /app/requirements.txt

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files to the containerCOPY . .


# Expose port 5000 for the application
EXPOSE 5000

# Set the command to run the application
CMD ["python", "getvidonline.py"]
