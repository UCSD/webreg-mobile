#!/bin/sh
set -e

echo "Running verify-env.sh $1"

if [ "$1" == "PROD" ]; then
	qa_slash=$(grep -rio "https.*\/qa" lib | wc -l | sed -e "s/^[ \t]*//")
	qa_dash=$(grep -rio "https.*-qa" lib | wc -l | sed -e "s/^[ \t]*//")
	dev_slash=$(grep -rio "https.*\/dev" lib | wc -l | sed -e "s/^[ \t]*//")
	dev_dash=$(grep -rio "https.*-dev" lib | wc -l | sed -e "s/^[ \t]*//")

	invalid_count=$((qa_slash + qa_dash + dev_slash + dev_dash))

	if [ "$invalid_count" -eq 0 ]; then
		echo "\nverify-env.sh PROD: PASS"
	else
		echo "\nset-env-prod: FAIL (erors: ${invalid_count})"
		grep -rin "https.*\/qa" lib
		grep -rin "https.*-qa" lib
		grep -rin "https.*\/dev" lib
		grep -rin "https.*-dev" lib
		exit 1
	fi
elif [ "$1" == "QA" ]; then
	prod_slash=$(grep -rio "https.*\/prod" lib | wc -l | sed -e "s/^[ \t]*//")
	prod_dash=$(grep -rio "https.*-prod" lib | wc -l | sed -e "s/^[ \t]*//")

	invalid_count=$((prod_slash + prod_dash))

	if [ "$invalid_count" -eq 0 ]; then
		echo "\nset-env-qa: PASS"
	else
		echo "\nset-env-qa: FAIL (erors: ${invalid_count})"
		grep -rin "https.*\/prod" lib
		grep -rin "https.*-prod" lib
		exit 1
	fi
else
	echo "Error: verify-env.sh: Environment not specified (PROD|QA)"
	exit 1
fi
