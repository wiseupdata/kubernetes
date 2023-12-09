
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="Wise Up Data's Instagram" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/instagram.png" />   
</a> 
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="wise Up Data's Discord" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/discord.png" />
</a>
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="wise Up Data | Twitter" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/twitter.png" />
</a>
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="wise Up Data's LinkedIN" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/linkedin.png" />
</a>

![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fwiseupdata%kubernetes&countColor=%2337d67a&style=flat)
![GitHub](https://img.shields.io/github/license/wiseupdata/kubernetes)


<h1>
<img align="left" alt="img" src="https://raw.githubusercontent.com/wiseupdata/kubernetes/main/assets/imgs/kubernetes.png" width="100" />

Kubernetes - Setup and Utils 🚀️

</h1>

<br>
<br>
<br>

# Utils

😍 [Create your own Kb8s cluster free and Hybrid](https://github.com/wiseupdata/kubernetes/tree/main/kb8-hybrid)

<br>

# Commands 💻

## 🏠 Home directory

```bash
cd $HOME/ && clear
```

## Create

### Create Name Space
```bash
kubectl create -n namespace-test
```

## Get

### Get all
```bash
kubectl get all -A
```

### Get Pods
```bash
pods=$(kubectl get pods -n namespace-test -o json | jq -r '.items[] | select(.metadata.name | contains("")) | .metadata.name') && echo $pods && echo $pods | xargs -n 1 kubectl logs -n namespace-test
```

### Get secrets
  ```bash
  kubectl get secret -n namespace-test airflow-webserver-secret-key -o jsonpath="{.data.webserver-secret-key}" | base64 --decode ; echo
```

## Delete

### Delete the chart
```

```bash
kubectl delete -f clean-stg.yaml -n namespace-test
```

### Delete the Pods
```bash
pods=$(kubectl get pods -n namespace-test -o json | jq -r '.items[] | select(.metadata.name | contains("")) | .metadata.name')
echo $pods
kubectl delete -n namespace-test pods $pods
```

### Delete the PV
```bash
kubectl delete pvc app-test -n namespace-test
kubectl get pvc -n namespace-test
```

### Delete Jobs
```bash
kubectl delete job app-test -n namespace-test
```

### Deep clean
```bash
kubectl api-resources --verbs=list -o name \
  | xargs -n 1 kubectl get --show-kind --ignore-not-found -n kube-system -o name \
  | grep airflow \
  | xargs -n 1 kubectl delete -A
```

### Delete the Name Space
```bash
kubectl delete ns namespace-test
```


# References🤘

1. [Wise Up Data - Github](https://github.com/wiseupdata)
1. [Free tier VM cluster](https://github.com/wiseupdata/terraform-oci-vm_cluster_free_tier)


---

<br>
<br><br>
---

#### Maintainer 🤗 👨‍💻

Sivio Liborio


- 💬 silllvio@hotmail.com
- 📧 silvio.liborio@wiseupdata.com
- 🌍 https://www.linkedin.com/in/silvio-de-melo-liborio/
