#!/bin/bash

echo "host: ${WAKEUP_HOST} - ${WAKEUP_MAC} wake up and wait"
wakeonlan -i $WAKEUP_HOST $WAKEUP_MAC
