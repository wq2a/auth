all:

init:
	composer install
	find vendor -type d -exec sudo chmod 755 {} \;
	find vendor -type f -exec sudo chmod 644 {} \;

update:
	# The md5sum of composer.json will be changed if edit the json file.
	# The update command will update the composer.lock file
	composer update --lock
