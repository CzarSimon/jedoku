VERSION='v1.12.1'
OS_ARCH='linux/amd64'

BASE_URL='https://storage.googleapis.com/kubernetes-release/release'
KUBECTL_URL="$BASE_URL/$VERSION/bin/$OS_ARCH/kubectl"

curl -LO $KUBECTL_URL
