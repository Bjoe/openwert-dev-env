groupmod -g ${GROUP_ID} build
usermod -u ${USER_ID} -g ${GROUP_ID} build
export DISPLAY=$DISPLAY
su -w DISPLAY -l build