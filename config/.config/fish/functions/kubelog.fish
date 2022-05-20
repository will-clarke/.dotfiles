function kubelog
    set -l pod (kubectl get pods $argv[2..-1] | grep $argv[1])
    set -l name (echo $pod | head -n1 | awk '{print $1}')
    echo $pod
    echo $name
    kubectl $argv[2..-1] logs $name
end
