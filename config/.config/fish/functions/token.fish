function token
gcloud auth login
set -Ux VERTEXAI_API_TOKEN (gcloud auth print-access-token)
make authorize-prod
end
