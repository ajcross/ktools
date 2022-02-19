# kset

## Description

Initial setup for kubernetes environment

Enables having a different context for each shell, and thus working in parallel in different cluster and/or namespaces

In adition it will load autocmpletion for different kubernetes related tools and set k as an alias for kubectl

Recomended to be used with:
. kube-ps1 [https://github.com/jonmosco/kube-ps1]
- kubectx and kubens: [https://github.com/ahmetb/kubectx/blob/master/README.md]

## Setup

Download and load in your bash with source:

#### Bash
```sh
source /path/to/kset.sh
```

enable with kon

```sh
$ kon
```

disable with koff
```sh
$ koff
```
