#!/bin/bash

LG=$(setxkbmap -query | awk '/layout/{print $2}')
if [ $LG == "hr" ]
then
	setxkbmap -layout us
else
	setxkbmap -layout hr
fi