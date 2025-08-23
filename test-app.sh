#!/bin/bash

echo "Testing MEAN Stack Application..."

# Test frontend
echo "1. Testing Frontend..."
FRONTEND_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
if [ $FRONTEND_STATUS -eq 200 ]; then
    echo " Frontend is accessible"
else
    echo " Frontend failed (Status: $FRONTEND_STATUS)"
fi

# Test backend API
echo "2. Testing Backend API..."
API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/api/tutorials)
if [ $API_STATUS -eq 200 ]; then
    echo " Backend API is accessible"
else
    echo " Backend API failed (Status: $API_STATUS)"
fi

# Test MongoDB connection
echo "3. Testing Database Connection..."
BACKEND_LOGS=$(docker-compose logs backend | grep "Connected to the database")
if [ ! -z "$BACKEND_LOGS" ]; then
    echo " Database connection successful"
else
    echo " Database connection failed"
fi

echo "Test completed!"