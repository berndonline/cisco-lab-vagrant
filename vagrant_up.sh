#!/bin/bash

EXIT=0
vagrant up rtr-1 --color <<< 'rtr-1 boot' || EXIT=$?
vagrant up rtr-2 --color <<< 'rtr-2 boot' || EXIT=$?
vagrant up rtr-3 --color <<< 'rtr-3 boot' || EXIT=$?
vagrant up rtr-4 --color <<< 'rtr-4 boot' || EXIT=$?
echo $EXIT
exit $EXIT
