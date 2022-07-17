function priv_ssh
    set TAG_NAME (echo -n $argv | cut -f 1 -d ".")
    set IP (aws-vault exec infosum-engineering-sandbox -- aws ec2 describe-instances --region eu-west-2 --filters "Name=tag:Name,Values=$TAG_NAME" | jq -r .Reservations[].Instances[].PrivateIpAddress)
    ssh $IP
end
