function token
    z flyt-connect-chatbot
    gcloud auth login
    set -e VERTEXAI_API_TOKEN
    set -Ux VERTEXAI_API_TOKEN (gcloud auth print-access-token)
    make authorize-prod
    cd -
end
