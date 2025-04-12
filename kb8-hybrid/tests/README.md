# Commands 💻

## 🏠 Home directory

```bash
cd $HOME/git/github/kubernetes/kb8-hybrid/tests && clear
```

```bash
pyenv activate .envKb8Hybrid
```

# Test internet access
> You should see the result ping
> 64 bytes from 140.82.121.3: seq=0 ttl=47 time=60.140 ms
```
kubectl delete pod dns-test
kubectl run -i --tty dns-test --image=busybox --restart=Never -- sh
nslookup github.com
ping github.com
```
