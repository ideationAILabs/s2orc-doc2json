# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install libmagic
RUN apt-get update && apt-get install -y libmagic1

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN python setup.py develop

# Expose port 8080 for the Flask app
EXPOSE 8080

# Define environment variable
ENV FLASK_APP=doc2json/flask/app.py

# Run the Flask app when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]