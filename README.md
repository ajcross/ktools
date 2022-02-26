# kset

## Description

Initial setup for kubernetes environment

Enables having a different context for each shell, and thus working in parallel in different cluster and/or namespaces

In adition it will load autocmpletion for different kubernetes related tools and set k as an alias for kubectl

Recomended to be used with:
- kube-ps1, to display context and namespace on the shell prompt [https://github.com/jonmosco/kube-ps1]
- kubectx and kubens, for fast switching between clusters and namespaces: [https://github.com/ahmetb/kubectx/blob/master/README.md]

Currently only supported/tested on recent versions of bash. 

## Setup

Download and load in your bash with source:

#### 
```sh
source /path/to/kset.sh
```

enable: 

```sh
$ kon
```

disable:
```sh
$ koff
```
