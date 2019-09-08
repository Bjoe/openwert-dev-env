groupmod -g ${GROUP_ID} build
usermod -u ${USER_ID} -g ${GROUP_ID} build
echo $DISPLAY # TODO
su -l build