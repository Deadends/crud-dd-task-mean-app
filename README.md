# MEAN Stack CRUD Application

A full-stack CRUD application using MongoDB, Express, Angular 15, and Node.js. The application manages tutorials with create, read, update, delete, and search functionality. Also attached all working images on ss-images folder 

## Architecture

- **Backend**: Node.js + Express REST API
- **Frontend**: Angular 15 SPA
- **Database**: MongoDB
- **Reverse Proxy**: Nginx
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions


### Manual Setup

#### Backend
```bash
cd backend
npm install
node server.js
```

#### Frontend
```bash
cd frontend
npm install
ng serve --port 8081
```

## Production Deployment

### Prerequisites
- Ubuntu VM (AWS)
- Docker Hub account
- GitHub repository


### 2. Manual VM Setup

```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone and deploy
git clone <repository-url> /opt/mean-app
cd /opt/mean-app
export DOCKER_USERNAME=your_docker_username
docker-compose -f docker-compose.prod.yml up -d
```

## CI/CD Setup

### GitHub Secrets Required

```
DOCKER_USERNAME=your_docker_hub_username
DOCKER_PASSWORD=your_docker_hub_password
HOST=your_vm_ip_address
USERNAME=ubuntu
SSH_KEY=your_private_ssh_key
```

### Pipeline Triggers
- Push to main branch
- Pull request to main branch

## Docker Images

### Build Locally
```bash
# Backend
docker build -t mean-backend ./backend

# Frontend
docker build -t mean-frontend ./frontend
```

### Push to Docker Hub
```bash
docker tag mean-backend your_username/mean-backend:latest
docker tag mean-frontend your_username/mean-frontend:latest
docker push your_username/mean-backend:latest
docker push your_username/mean-frontend:latest
```

## Configuration

### Environment Variables
- `MONGODB_URI`: MongoDB connection string
- `DOCKER_USERNAME`: Docker Hub username

### Ports
- Application: 80 (Nginx reverse proxy)
- Backend API: 8080 (internal)
- Frontend: 80 (internal)
- MongoDB: 27017 (internal)

## API Endpoints

```
GET    /api/tutorials       - Get all tutorials
POST   /api/tutorials       - Create tutorial
GET    /api/tutorials/:id   - Get tutorial by ID
PUT    /api/tutorials/:id   - Update tutorial
DELETE /api/tutorials/:id   - Delete tutorial
DELETE /api/tutorials       - Delete all tutorials
GET    /api/tutorials?title=<title> - Search by title
```

## Monitoring

```bash
# Check container status
docker-compose ps

# View logs
docker-compose logs -f

# Monitor resources
docker stats
```

## Troubleshooting

### Common Issues

1. **MongoDB Connection Failed**
   ```bash
   docker-compose restart mongodb
   ```

2. **CORS Errors**
   - Verify backend CORS configuration
   - Check Nginx proxy settings

3. **Build Failures**
   ```bash
   docker system prune -a
   docker-compose build --no-cache
   ```

## Security Considerations

- MongoDB runs without authentication (development only)
- Use environment variables for sensitive data
- Implement proper authentication in production
- Use HTTPS with SSL certificates


