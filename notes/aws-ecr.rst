git clone https://github.com/ARM-software/Tool-Solutions.git
cd Tool-Solutions/docker/tensorflow-aarch64


./build.sh --build-type full  --onednn acl --bazel_memory_limit 30000 --jobs 16
docker tag docker.io/library/tensorflow-v2acl:latest public.ecr.aws/u4g7z4f7/tensorflow-aarch64

cat << EOF > repo_config.json

{
    "description": "TF2 on ARM64",
    "architectures": [
        "aarch64"
    ],
    "operatingSystems": [
        "Linux"
    ],
    "logoImageBlob": "",
    "aboutText": "TF2 on ARM64",
    "usageText": ""
}
EOF

aws ecr-public create-repository  --repository-name tensorflow-aarch64 --catalog-data  file://repo_config.json --region us-east-1
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws

docker push public.ecr.aws/u4g7z4f7/tensorflow-aarch64


References
==========

https://dev.to/aws-builders/using-the-aws-public-container-registry-for-tensorflow-2-on-graviton-processors-1hl3
https://community.arm.com/developer/tools-software/tools/b/tools-software-ides-blog/posts/aarch64-docker-images-for-tensorflow-and-pytorch
