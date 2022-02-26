

KSET_DEFAULT_KUBECONFIG=$HOME/.kube/config
KSET_KUBECONFIG_DIR="$HOME/.kube/configs/"
KSET_COMPLETION_TOOLS="kubectl oc velero tkn helm kn"
KSET_KUBECONFIG=${KSET_KUBECONFIG_DIR}/config.$$

kset_logout() {
  rm -f "$KSET_KUBECONFIG"
}
trap kset_logout EXIT

kon() {
   local _KUBECONFIG
   if [ "$KUBECONFIG" == "$KSET_KUBECONFIG" ]; then
   	echo "Already on" >&2
   else  
	if [ -z ${KUBECONFIG+x} ]; then
                unset KSET_PREV_KUBECONFIG
        else
   		KSET_PREV_KUBECONFIG=$KUBECONFIG
        fi
   	_KUBECONFIG="${KUBECONFIG:-$KSET_DEFAULT_KUBECONFIG}"
   	mkdir -p $KSET_KUBECONFIG_DIR
        kubectl config view --raw >$KSET_KUBECONFIG
   	export KUBECONFIG=$KSET_KUBECONFIG
   fi
   if hash kubeon 2>/dev/null; then
   	kubeon
   fi
}

koff() {
   if [ "$KUBECONFIG" != "$KSET_KUBECONFIG" ]; then
	echo "Already off" >&2
   else 
   	if hash kubeoff 2>/dev/null; then
   		kubeoff
   	fi
   	if [ -z ${KSET_PREV_KUBECONFIG+x} ]; then
       	 	unset KUBECONFIG
   	else
        	KUBECONFIG=$KSET_PREV_KUBECONFIG
        	unset KSET_PREV_KUBECONFIG
   	fi
   	rm -f $KSET_KUBECONFIG
   fi
}

# this won't work in BASH version provided by macos
for cmd in velero $KSET_COMPLETION_TOOLS
do
        if hash $cmd  2>/dev/null
        then
		source <($cmd completion bash) 
        fi
done

alias k=kubectl
complete -F __start_kubectl k
