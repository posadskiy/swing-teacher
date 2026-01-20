# Kubernetes Deployment for SwingTeacher Service

This directory contains Kubernetes manifests for deploying the SwingTeacher service to the cluster at `168.119.57.22`.

## Prerequisites

- Kubernetes cluster access (k3s/k8s)
- kubectl configured to access the cluster
- Docker image built and available in the cluster registry

## Files

- `deployment.yaml` - Main deployment configuration
- `service.yaml` - Service definition for internal cluster access
- `configmap.yaml` - Configuration values
- `secret.yaml.example` - Example secret file (create actual secret separately)
- `network-policy.yaml` - Network policy for cross-namespace communication

## Deployment Steps

### 1. Create Secrets

First, create the secret file from the example:

```bash
# Copy and edit the secret file
cp secret.yaml.example secret.yaml
# Edit secret.yaml with actual values
# Then create the secret
kubectl apply -f secret.yaml
```

Or create secrets directly:

```bash
kubectl create secret generic swingteacher-secrets \
  --from-literal=db.user=swingteacher \
  --from-literal=db.password=your-password \
  -n default
```

### 2. Apply ConfigMap

```bash
kubectl apply -f configmap.yaml
```

### 3. Deploy Service

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 4. Apply Network Policy (Optional)

If you need to restrict network access:

```bash
kubectl apply -f network-policy.yaml
```

## Configuration

### Auth Service Connection

The service is configured to connect to the auth-service in the `auth` namespace:
- Service URL: `http://auth-service.auth.svc.cluster.local:8100`

### Cross-Namespace Communication

The service communicates with:
- **Auth Service**: Located in `auth` namespace at `auth-service.auth.svc.cluster.local:8100`
- **Database**: Located in `default` namespace (or as configured)

Kubernetes allows cross-namespace communication by default. If Network Policies are enabled, ensure they allow traffic
between namespaces.

## Verification

Check deployment status:

```bash
kubectl get deployments -n default
kubectl get pods -n default -l app=swingteacher-service
kubectl get services -n default
```

Check logs:

```bash
kubectl logs -f deployment/swingteacher-service -n default
```

## Troubleshooting

### Cannot connect to auth-service

1. Verify auth-service is running:
   ```bash
   kubectl get pods -n auth
   kubectl get services -n auth
   ```

2. Check network policies:
   ```bash
   kubectl get networkpolicies -n default
   kubectl get networkpolicies -n auth
   ```

3. Test connectivity from a pod:
   ```bash
   kubectl run -it --rm debug --image=curlimages/curl --restart=Never -- curl http://auth-service.auth.svc.cluster.local:8100/health
   ```

### Database Connection Issues

1. Verify database service:
   ```bash
   kubectl get services | grep postgres
   ```

2. Check database credentials in secrets:
   ```bash
   kubectl get secret swingteacher-secrets -o yaml
   ```

## Updating Deployment

To update the deployment:

```bash
# Update image
kubectl set image deployment/swingteacher-service swingteacher-service=swingteacher-service:new-tag -n default

# Or apply updated manifests
kubectl apply -f deployment.yaml
```

## Rollback

To rollback to a previous version:

```bash
kubectl rollout undo deployment/swingteacher-service -n default
```
