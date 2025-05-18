red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

if [ -z "$CLUSTERDOMAIN" ]; then
    echo "${red}An Error has occurerd"
    echo "Variable CLUSTERDOMAIN is empty .. exitting now!"
    echo "Setup CLUSTERDOMAIN (looks like sandbox4134.opentlc.com) and run this script again${reset}"
    exit 1
fi


echo "Replacing ENV vars in HTTP Route"
cat http-route.yaml.template | envsubst  > http-route.yaml
echo "Creating HTTP Route"
oc apply -f http-route.yaml
echo "${green}HTTP Route created${reset}"
