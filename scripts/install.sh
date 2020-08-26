#!/bin/bash

sudo echo -n

selected_version=`curl -s https://releases.hashicorp.com/terraform/ | grep -Po 'terraform/\K[^/"]*' | sed -E '/\d*.\d*.\d*-\.*/d' | awk '!seen[$0]++' | grep -wE "^${1:-none}$"`
matches=`echo -n $selected_version | awk 'END{print NR}'`

if [ $matches -ne 1 ]; then
	echo -e "Could not figure out which version you want. $matches versions matched"
	exit 1
fi

if [ ! -e "${HOME}/.terraform/cache/${selected_version}.zip" ]; then
	rm -rf "${HOME}/.terraform/bin/${selected_version}"
	echo -e "\e[1m\e[32m[download]\e[0m Downloading version $selected_version"
	curl --progress-bar "https://releases.hashicorp.com/terraform/${selected_version}/terraform_${selected_version}_linux_amd64.zip" --create-dirs -o "${HOME}/.terraform/cache/${selected_version}.zip"
else
	echo -e "\e[1m\e[32m[download]\e[0m $selected_version already downloaded"
fi

if [ ! -e "${HOME}/.terraform/bin/${selected_version}/terraform" ]; then
	echo -e -n "\e[1m\e[32m[extract ]\e[0m Extracting version $selected_version to ${HOME}/.terraform/bin/${selected_version} ... "
	mkdir -p "${HOME}/.terraform/bin/" && unzip -qq "${HOME}/.terraform/cache/${selected_version}.zip" -d "${HOME}/.terraform/bin/${selected_version}"
	echo -e "done"
else
	echo -e "\e[1m\e[32m[extract ]\e[0m $selected_version already extracted"
fi

echo -e -n "\e[1m\e[32m[symlink ]\e[0m Linking version $selected_version ... "
sudo ln -fs "${HOME}/.terraform/bin/${selected_version}/terraform" "/usr/local/bin/terraform"
echo -e "done"
