#! /bin/bash

if [ -z "$1" ]; then
    echo "No URL/SAS found. Exiting"
    exit 1
fi

cp /usr/src/mariner/SRPMS/*.rpm /usr/src/mariner/RPMS/
pushd /usr/src/mariner/RPMS
createrepo .
popd

export url="$1"
if [ -z "$2" ]; then
    export folder="repo"
else
    export folder=$2
fi
export base="${url%%\?*}"
export sas="${url#*\?}"
export baseurl="$base/$folder"


#multiline echo into a file
cat << EOF > /usr/src/mariner/RPMS/test.repo
[testrepo]
name=Test Repo
baseurl=$baseurl/RPMS
gpgcheck=0
enabled=1
EOF

azcopy copy /usr/src/mariner/RPMS "$baseurl?$sas" --recursive=true

echo "wget $baseurl/RPMS/test.repo -O /etc/yum.repos.d/test.repo"
