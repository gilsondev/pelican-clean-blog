help:
	@echo 'Makefile for localization'
	@echo ''
	@echo 'Usage:'
	@echo '  make extract             Extract translatable strings from templates'
	@echo '  make init lang=lang      Initialize the message catalogs with a new language (e.g make init lang=ja)'
	@echo '  make compile             Compile the message catalogs'
	@echo '  make update              Update the catalogs when templates change'

extract:
	pybabel extract --mapping babel.cfg --output messages.pot ./

init:
	pybabel init --input-file messages.pot --output-dir translations/ --locale $$lang --domain messages

compile:
	pybabel compile --directory translations/ --domain messages

update:
	pybabel update --input-file messages.pot --output-dir translations/ --domain messages

