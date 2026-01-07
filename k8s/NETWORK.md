# Network Configuration and Cross-Namespace Communication

## Overview

The SwingTeacher service needs to communicate with the auth-service, which may be deployed in a different namespace or
on a different host.

## Network Connectivity

### Kubernetes Cluster (Production)

In Kubernetes, pods can communicate across namespaces by default using DNS service discovery:

- **Service DNS Format**: `<service-name>.<namespace>.svc.cluster.local`
- **Example**: `auth-service.auth.svc.cluster.local:8100`

### Cross-Namespace Communication

By default, Kubernetes allows pods in different namespaces to communicate. However, if Network Policies are enabled,
they might restrict such communication.

#### Checking Network Policies

```bash
# Check network policies in default namespace
kubectl get networkpolicies -n default

# Check network policies in auth namespace
kubectl get networkpolicies -n auth
```

#### Network Policy Configuration

If network policies are blocking communication, you have two options:

1. **Update Network Policy** (Recommended): Allow traffic between namespaces
2. **Deploy in Same Namespace**: Deploy both services in the same namespace

The `network-policy.yaml` file includes a policy that allows communication between the `default` and `auth` namespaces.

### Testing Connectivity

#### From a Pod

```bash
# Test connectivity to auth-service from a pod
kubectl run -it --rm debug --image=curlimages/curl --restart=Never -- \
  curl -v http://auth-service.auth.svc.cluster.local:8100/health
```

#### From the Service Pod

```bash
# Get into the service pod
kubectl exec -it deployment/swingteacher-service -n default -- /bin/sh

# Test connectivity
curl http://auth-service.auth.svc.cluster.local:8100/health
```

### Troubleshooting

#### Issue: Cannot connect to auth-service

1. **Verify Service Exists**:
   ```bash
   kubectl get services -n auth
   kubectl get services -A | grep auth-service
   ```

2. **Check Service Endpoints**:
   ```bash
   kubectl get endpoints -n auth auth-service
   ```

3. **Verify Pods are Running**:
   ```bash
   kubectl get pods -n auth -l app=auth-service
   ```

4. **Check Network Policies**:
   ```bash
   kubectl describe networkpolicy -n default
   kubectl describe networkpolicy -n auth
   ```

5. **Check DNS Resolution**:
   ```bash
   kubectl run -it --rm dns-test --image=busybox --restart=Never -- \
     nslookup auth-service.auth.svc.cluster.local
   ```

#### Issue: Connection Timeout

- Verify the auth-service is listening on port 8100
- Check if firewall rules are blocking traffic
- Verify service selector matches pod labels

#### Issue: DNS Resolution Fails

- Ensure CoreDNS is running: `kubectl get pods -n kube-system | grep coredns`
- Check DNS configuration: `kubectl get configmap coredns -n kube-system -o yaml`

## Configuration Options

### Option 1: Cluster-Internal (Recommended)

Use Kubernetes service DNS for cluster-internal communication:

```yaml
AUTH_SERVICE_BASE_URL: "http://auth-service.auth.svc.cluster.local:8100"
```

### Option 2: External Access

If auth-service is exposed via external IP or LoadBalancer:

```yaml
AUTH_SERVICE_BASE_URL: "http://168.119.57.22:8100"
```

### Option 3: Same Namespace

If both services are in the same namespace:

```yaml
AUTH_SERVICE_BASE_URL: "http://auth-service:8100"
```

## Network Policy Example

The included `network-policy.yaml` allows:

- **Ingress**: Traffic from `default` and `auth` namespaces
- **Egress**:
    - Traffic to `default` and `auth` namespaces (ports 8100, 5432)
    - DNS queries (port 53)

To apply:

```bash
kubectl apply -f network-policy.yaml
```

## Security Considerations

1. **Use Service DNS**: Prefer cluster-internal service DNS over external IPs
2. **Network Policies**: Implement network policies to restrict unnecessary traffic
3. **TLS**: Consider using TLS for inter-service communication
4. **Service Mesh**: For production, consider using a service mesh (Istio, Linkerd) for advanced networking features
